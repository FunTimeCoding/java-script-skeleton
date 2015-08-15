var javaScriptSkeleton = function() {
    this.name = 'Friend.';
};

javaScriptSkeleton.prototype.hello = function () {
    return 'Hello ' + this.name;
};

module.exports = javaScriptSkeleton;
