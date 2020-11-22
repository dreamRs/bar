import 'widgets';
import { asHeader } from '../modules/header.js';
import ProportionsChart from 'proportions-chart';

HTMLWidgets.widget({

  name: 'bar',

  type: 'output',

  factory: function(el, width, height) {

    var bar;

    return {

      renderValue: function(x) {

        bar = ProportionsChart()
          .width(width)
          .height(height)
          .data(x.data)
          .color(function(d) {
            return x.colors[d.name];
          })
          (document.getElementById(el.id));

      },

      resize: function(width, height) {

        bar
          .width(width)
          .height(height);

      }

    };
  }
});
