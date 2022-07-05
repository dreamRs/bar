import 'widgets';
import { asHeader } from '../modules/header.js';
import ProportionsChart from 'proportions-chart';

HTMLWidgets.widget({

  name: 'bar',

  type: 'output',

  factory: function(el, width, height) {

    const barChart = ProportionsChart();
    var bar;

    return {

      renderValue: function(x) {
        
        if (typeof bar == "undefined") {
          bar = barChart(el)
            .width(width)
            .height(height);
        }

        bar
          .data(x.data)
          .color(function(d) {
            return x.colors[d.name];
          })
          .onClick(function(value) {
            if (HTMLWidgets.shinyMode) {
              Shiny.setInputValue(el.id + "_click", value.name);
            }
          });

      },

      resize: function(width, height) {

        barChart
          .width(width)
          .height(height);

      }

    };
  }
});
