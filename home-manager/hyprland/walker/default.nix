{inputs, ...}: {
  imports = [inputs.walker.homeManagerModules.default];

  programs.walker = {
    enable = true;
    runAsService = true;

    config = {
      app_launcher_prefix = "uwsm app --";

      style = ''
        @define-color foreground #d7d2ce;
        @define-color background #03142C;
        @define-color cursor #d7d2ce;

        @define-color color0 #03142C;
        @define-color color1 #EAAD79;
        @define-color color2 #1E6D8B;
        @define-color color3 #5F6F88;
        @define-color color4 #2D94A8;
        @define-color color5 #5AA6B1;
        @define-color color6 #57BDC8;
        @define-color color7 #d7d2ce;
        @define-color color8 #969390;
        @define-color color9 #EAAD79;
        @define-color color10 #1E6D8B;
        @define-color color11 #5F6F88;
        @define-color color12 #2D94A8;
        @define-color color13 #5AA6B1;
        @define-color color14 #57BDC8;
        @define-color color15 #d7d2ce;

        #window,
        #box,
        #aiScroll,
        #aiList,
        #search,
        #password,
        #input,
        #prompt,
        #clear,
        #typeahead,
        #list,
        child,
        scrollbar,
        slider,
        #item,
        #text,
        #label,
        #bar,
        #sub,
        #activationlabel {
          all: unset;
        }

        #cfgerr {
          background: rgba(255, 0, 0, 0.4);
          margin-top: 20px;
          padding: 8px;
          font-size: 1.2em;
        }

        #window {
          color: @foreground;
        }

        #box {
          border-radius: 1rem;
          background: @background;
          padding: 2rem;
          border: 1px solid lighter(@background);
          box-shadow:
            0 19px 38px rgba(0, 0, 0, 0.3),
            0 15px 12px rgba(0, 0, 0, 0.22);
        }

        #search {
          box-shadow:
            0 1px 3px rgba(0, 0, 0, 0.1),
            0 1px 2px rgba(0, 0, 0, 0.22);
          background: lighter(@background);
          padding: 8px;
        }

        #prompt {
          margin-left: 4px;
          margin-right: 12px;
          color: @foreground;
          opacity: 0.2;
        }

        #clear {
          color: @foreground;
          opacity: 0.8;
        }

        #password,
        #input,
        #typeahead {
          border-radius: 2px;
        }

        #input {
          background: none;
        }

        #password {
        }

        #spinner {
          padding: 8px;
        }

        #typeahead {
          color: @foreground;
          opacity: 0.8;
        }

        #input placeholder {
          opacity: 0.5;
        }

        #list {
        }

        child {
          padding: 8px;
          border-radius: 2px;
        }

        child:selected,
        child:hover {
          background: alpha(@color1, 0.4);
        }

        #item {
        }

        #icon {
          margin-right: 8px;
        }

        #text {
        }

        #label {
          font-weight: 500;
        }

        #sub {
          opacity: 0.5;
          font-size: 0.8em;
        }

        #activationlabel {
        }

        #bar {
        }

        .barentry {
        }

        .activation #activationlabel {
        }

        .activation #text,
        .activation #icon,
        .activation #search {
          opacity: 0.5;
        }

        .aiItem {
          padding: 10px;
          border-radius: 2px;
          color: @foreground;
          background: @background;
        }

        .aiItem.user {
          padding-left: 0;
          padding-right: 0;
        }

        .aiItem.assistant {
          background: lighter(@background);
        }
      '';
    };
  };
}
