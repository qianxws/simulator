package com.cinema.sys.utils;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

/**
 * 文件下载帮助类<br>
 * 简单的重构了这个类：将方法分为真实路径下载/相对路径下载两类<br>
 * 文件下载不到的时候，会提示404
 * 
 * @author 杨彪
 * 
 */
public class FileDownloadUtil {

    /** 日志对象 */
    private static final Logger LOG = Logger.getLogger(FileDownloadUtil.class);

    /**
     * 文件的下载
     * 
     * @param request
     *            请求
     * @param response
     *            相应
     * @param canonicalPath
     *            相对路径
     * @param fileName
     *            文件的名称，如果该值为空，则使用真实文件的文件名作为下载的文件名称。
     */
    public static void downloadCanonicalFile(HttpServletRequest request, HttpServletResponse response,
            String canonicalPath, String fileName) {

        // 根据相对路径，找到文件
        String path = request.getSession().getServletContext().getRealPath(canonicalPath);
        // 调用文件的下载
        downloadAbsoluteFile(request, response, new File(path), fileName);
    }

    /**
     * 下载服务器上的一个物理文件
     * 
     * @param request
     *            请求
     * @param response
     *            相应
     * @param downLoadFile
     *            要下载的文件
     * @param fileName
     *            文件的名称，如果该值为空，则使用真实文件的文件名作为下载的文件名称。
     * @return 正常情况下，返回null，否则返回/error/404
     */
    public static void downloadAbsoluteFile(HttpServletRequest request, HttpServletResponse response, File downLoadFile,
            String fileName) {

        // 如果待下载的文件不存在
        if (!downLoadFile.exists()) {

            LOG.error("找不到要下载的文件：" + downLoadFile.getAbsolutePath());

            // 返回404状态码
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);

            // 因为某些浏览器(如360)存在自己的错误页面，但是有些浏览器404页面为空白
            //
            try {
                request.getRequestDispatcher("/error/404.jsp").forward(request, response);
            } catch (ServletException | IOException e) {
                LOG.error(e.getMessage(), e);
            }

            return;
        }

        // 赋予默认的文件名
        if (StringUtils.isBlank(fileName)) {
            fileName = downLoadFile.getName();
        }

        FileInputStream is = null;
        BufferedInputStream bis = null;
        OutputStream os = null;
        BufferedOutputStream bos = null;
        try {
            // 设置下载框中的弹出信息
            response.setHeader("content-disposition",
                    "attachment;filename=" + new String(fileName.getBytes("GBK"), "ISO-8859-1"));

            // 读取要下载的文件,保存到文件输入流
            is = new FileInputStream(downLoadFile);
            bis = new BufferedInputStream(is);
            // 创建输出流
            os = response.getOutputStream();
            bos = new BufferedOutputStream(os);

            // 创建缓冲区
            // IPv4的数据报最大大小是65535字节，包括IPv4首部。因为首部中说明大小的字段为16位。
            // IPv6的数据报最大大小是65575字节，包括40字节的IPv6首部。同样是展16位，但是IPv6首部大小不算在里面，所以总大小比IPv4大一个首部（40字节）。
            // 计算得知数据包大小建议为64K，因此我们使用64K*2的形式，来简单的提高效率。
            byte[] buffer = new byte[1024 * 64 * 2];
            int len = 0;
            while ((len = bis.read(buffer)) > 0) {
                bos.write(buffer, 0, len);
            }

        } catch (UnsupportedEncodingException e) {
            LOG.error(e.getMessage(), e);
        } catch (FileNotFoundException e) {
            LOG.error(e.getMessage(), e);
        } catch (IOException e) {
            LOG.error(e.getMessage(), e);
        } finally {
            if (is != null) {
                try {
                    is.close();
                } catch (IOException e) {
                    LOG.error(e.getMessage(), e);
                }
            }

            if (bis != null) {
                try {
                    bis.close();
                } catch (IOException e) {
                    LOG.error(e.getMessage(), e);
                }
            }

            if (os != null) {
                try {
                    os.close();
                } catch (IOException e) {
                    LOG.error(e.getMessage(), e);
                }
            }

            if (bos != null) {
                try {
                    bos.close();
                } catch (IOException e) {
                    LOG.error(e.getMessage(), e);
                }
            }
        }
    }
}
