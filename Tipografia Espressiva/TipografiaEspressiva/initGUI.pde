void initGUI() {
  // Inizializza i controller:   
  int sw = 200; // Slider Width 
  int sh = 18;  // Slider Height
  int l = 20;   // Button Dimension 

  // Default setting
  ControlP5 cp5 = new ControlP5(this);
  cp5.setColorActive(color(220, 0, 0));
  cp5.setColorForeground(color(200, 0, 0));
  cp5.setColorBackground(color(220, 100));
  cp5.setColorCaptionLabel(color(255));
  cp5.setPosition(10, -10);

  // Some sliders (Size, Leading, Opacity, Weight)
  cp5.addSlider("size").setValue(30).setRange(2, 400).setSize(sw, sh).linebreak();
  cp5.addSlider("leading").setValue(50).setRange(0.1, 300).setSize(sw, sh).linebreak();
  cp5.addSlider("opacity").setValue(255) .setRange(0, 255).setSize(sw, sh).linebreak();
  cp5.addSlider("weight").setRange(0, 3).setValue(0).setSize(sw, sh).linebreak();
  cp5.addSlider("posX").setRange(0, w).setValue(0).setSize(sw, sh).linebreak();
  cp5.addSlider("posY").setRange(0, h).setValue(0).setSize(sw, sh).linebreak();

  // Color mode
  cp5.addRadioButton("radio").setPosition(90, 170).setItemWidth(l).setItemHeight(l).setColorLabel(color(255))
    .addItem("B/W", 0)
    .addItem("W/B", 1)
    .addItem("COL", 2)
    .activate(0);

  // Text Align
  alignButton = cp5.addRadioButton("align").setPosition(160, 170).setItemWidth(l).setItemHeight(l).setColorLabel(color(255))
    .addItem("LEFT", 0)
    .addItem("CENTER", 1)
    .addItem("RIGHT", 2)
    .addItem("C/C", 3)
    .activate(0);


  // Mode
  modeButton = cp5.addRadioButton("mode").setPosition(10, 170).setItemWidth(l).setItemHeight(l).setColorLabel(color(255))
    .addItem("Mode 1", 1)
    .addItem("Mode 2", 2)
    .activate(0);
  ;

  // Save PDF Button
  cp5.addButton("savePDF").setSwitch(false).setPosition(10, 400).setSize(200, 19).setLabel("save PDF");
}

void controlEvent(ControlEvent theEvent) {
  if (theEvent.isFrom(alignButton)) tAlign = int(theEvent.getGroup().getValue());
  if (theEvent.isFrom(modeButton))  mode   = int(theEvent.getGroup().getValue());
}
