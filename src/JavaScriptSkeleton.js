var javaScriptSkeleton = function() {
    this.name = 'friend.';
};

javaScriptSkeleton.prototype.hello = function () {
    return 'Hello ' + this.name;
};

module.exports = javaScriptSkeleton;
