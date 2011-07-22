jasmine.Fixtures.prototype.loadTemplate_ = function(template) {
  var templateUrl = "/spec/javascripts/fixtures/" + template;
  var self = this;  
    $.ajax({
    async: false, // must be synchronous to guarantee that no tests are run before fixture is loaded
    cache: false,
    dataType: 'html',
    url: templateUrl,
    success: function(data) {
      $('#' + self.containerId).append(data);
    }
  });
};

function loadTemplate(template) {
  jasmine.getFixtures().loadTemplate_(template);
}