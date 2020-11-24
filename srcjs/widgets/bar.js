import 'widgets';
import { asHeader } from '../modules/header.js';
import ProportionsChart from 'proportions-chart';

HTMLWidgets.widget({

  name: 'bar',

  type: 'output',

  factory: function(el, width, height) {

    const barChart = ProportionsChart();

    return {

      renderValue: function(x) {

        barChart(el)
          .width(width)
          .height(height)
          .data(x.data)
          .color(function(d) {
            return x.colors[d.name];
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
