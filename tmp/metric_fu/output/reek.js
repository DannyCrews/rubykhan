              var g = new Bluff.Line('graph', "1000x600");
      g.theme_37signals();
      g.tooltips = true;
      g.title_font_size = "24px"
      g.legend_font_size = "12px"
      g.marker_font_size = "10px"

        g.title = 'Reek: code smells';
        g.data('IrresponsibleModule', [2]);
g.data('DuplicateMethodCall', [1]);
g.data('UtilityFunction', [1]);
g.data('UncommunicativeVariableName', [1]);
g.data('FeatureEnvy', [1]);
        g.labels = {"0":"11/27"};
        g.draw();
