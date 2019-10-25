function xmlToJson(doc) {
    return {
        models: paserModels(doc),
        pages: parerPages(doc)
    };
}

function paserModels(doc) {
    var modelsNodes = doc.getElementsByTagName('models')[0].children;

    var models = [];
    $(modelsNodes).each(function () {
        var modelNode = this;

        models.push({
            id: $.trim(modelNode.getElementsByTagName('id')[0].textContent),
            code: $.trim(modelNode.getElementsByTagName('code')[0].textContent)
        });
    });

    return models;
}

function parerPages(doc) {
    var pagesNodes = doc.getElementsByTagName('pages')[0].children;

    var pages = {};
  
    $(pagesNodes).each(function () {
        pages[this.nodeName] = {
            layout: parerLayout(this.getElementsByTagName('layout')[0])
        }
    });

    return pages;
}


function parerLayout(node) {
    var children = node.children;
    var layout = {};
    $(children).each(function () {
        layout[this.nodeName] = parerLayoutRegion(this);
    });

    return layout;
}

function parerLayoutRegion(node) {
    var children = node.children;

    var regions = [];
    $(children).each(function () {
        regions.push($.trim(this.textContent));
    });

    return regions;
}