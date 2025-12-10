import 'package:flutter/material.dart';
import 'dart:math' as math;

// ======================== THEME COLORS =======================
const kPrimaryColor = Color(0xFFFF7643);
const kTextGray = Color(0xFF757575);
const kSoftBackground = Color(0xFFF5F6F9);

// ======================== MAIN SCREEN =========================

class Parking3DScreen extends StatefulWidget {
  const Parking3DScreen({super.key});

  @override
  State<Parking3DScreen> createState() => _Parking3DScreenState();
}

class _Parking3DScreenState extends State<Parking3DScreen> {
  static const int rows = 4;
  static const int cols = 6;
  static const double angle = 14;

  // Slot status table
  late List<List<SlotStatus>> slots;

  @override
  void initState() {
    super.initState();

    // Generate sample slots
    slots = List.generate(rows, (r) {
      return List.generate(cols, (c) {
        // Random booked slots
        return (r + c) % 5 == 0 ? SlotStatus.booked : SlotStatus.available;
      });
    });
  }

  void toggleSlot(int r, int c) {
    if (slots[r][c] == SlotStatus.booked) return;

    setState(() {
      slots[r][c] = slots[r][c] == SlotStatus.selected
          ? SlotStatus.available
          : SlotStatus.selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    const double unitW = 80;
    const double unitH = 140;

    return Scaffold(
      backgroundColor: Colors.white,

      // ---------------- APP BAR ---------------- //
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Parking Slots",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),

      body: Column(
        children: [
          const SizedBox(height: 8),

          const Text(
            "Select Your Parking Slot",
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
          ),

          const SizedBox(height: 6),
          const Text(
            "Choose from available slots below",
            style: TextStyle(color: kTextGray, fontSize: 14),
          ),

          const SizedBox(height: 16),

          // ---------------- LEGEND ---------------- //
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              LegendItem(color: kSoftBackground, label: "Available"),
              SizedBox(width: 18),
              LegendItem(color: kPrimaryColor, label: "Selected"),
              SizedBox(width: 18),
              LegendItem(color: Color(0xFFD32F2F), label: "Booked"),
            ],
          ),

          const SizedBox(height: 16),

          // ---------------- PARKING ZOOM AREA ---------------- //
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: kSoftBackground,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: kTextGray.withOpacity(0.2)),
              ),
              child: InteractiveViewer(
                minScale: 0.6,
                maxScale: 2.5,
                boundaryMargin: const EdgeInsets.all(100),
                child: SizedBox(
                  width: cols * unitW + 100,
                  height: rows * unitH + 200,
                  child: Stack(
                    children: [
                      // Painter (lanes + outlines)
                      CustomPaint(
                        size: Size(cols * unitW + 100, rows * unitH + 200),
                        painter: ParkingPainter(
                          rows: rows,
                          cols: cols,
                          unitW: unitW,
                          unitH: unitH,
                        ),
                      ),

                      // ---------------- SLOTS ---------------- //
                      for (int r = 0; r < rows; r++)
                        for (int c = 0; c < cols; c++)
                          Positioned(
                            left: 50 + c * unitW,
                            top: 60 + r * unitH,
                            child: ParkingSlotWidget(
                              id: "${String.fromCharCode(65 + r)}${c + 1}",
                              isBooked: slots[r][c] == SlotStatus.booked,
                              isSelected: slots[r][c] == SlotStatus.selected,
                              onTap: () => toggleSlot(r, c),
                              angle: angle,
                              width: unitW * 0.9,
                              height: unitH * 0.75,
                            ),
                          ),

                      // Row Labels A B C D
                      for (int r = 0; r < rows; r++)
                        Positioned(
                          left: 8,
                          top: 60 + r * unitH + unitH * 0.25,
                          child: Text(
                            String.fromCharCode(65 + r),
                            style: const TextStyle(
                              color: kTextGray,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                      // Column Labels 1 2 3 4 5 6
                      for (int c = 0; c < cols; c++)
                        Positioned(
                          left: 50 + c * unitW + unitW * 0.3,
                          top: 36,
                          child: RotatedBox(
                            quarterTurns: -1,
                            child: Text(
                              "${c + 1}",
                              style: const TextStyle(
                                  color: kTextGray, fontSize: 14),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // ---------------- CONFIRM BUTTON ---------------- //
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: kPrimaryColor,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 48),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
              ),
              child: const Text("Confirm Selection",
                  style: TextStyle(fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }
}

// ======================== SLOT STATUS ENUM =======================
enum SlotStatus { available, selected, booked }

// ======================== LEGEND WIDGET ==========================
class LegendItem extends StatelessWidget {
  final Color color;
  final String label;

  const LegendItem({super.key, required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
        const SizedBox(width: 6),
        Text(label, style: const TextStyle(color: kTextGray)),
      ],
    );
  }
}

// ======================== ANIMATED SLOT WIDGET ===================

class ParkingSlotWidget extends StatefulWidget {
  final bool isBooked;
  final bool isSelected;
  final String id;
  final VoidCallback onTap;
  final double angle;
  final double width;
  final double height;

  const ParkingSlotWidget({
    super.key,
    required this.isBooked,
    required this.isSelected,
    required this.id,
    required this.onTap,
    required this.angle,
    required this.width,
    required this.height,
  });

  @override
  State<ParkingSlotWidget> createState() => _ParkingSlotWidgetState();
}

class _ParkingSlotWidgetState extends State<ParkingSlotWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnim;

  //Already booked car popup "Already Booked"
  void showBookedPopup() {
    final overlay = Overlay.of(context);
    final renderBox = context.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero);

    OverlayEntry entry = OverlayEntry(
      builder: (context) {
        return Positioned(
          left: position.dx,
          top: position.dy - 40, // show above the slot
          child: Material(
            color: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 6,
                  )
                ],
              ),
              child: const Text(
                "Already Booked",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ),
        );
      },
    );

    overlay.insert(entry);

    Future.delayed(const Duration(milliseconds: 900), () {
      entry.remove();
    });
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 220),
      vsync: this,
    );

    _scaleAnim = Tween<double>(begin: 1.0, end: 1.10).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );
  }

  @override
  void didUpdateWidget(covariant ParkingSlotWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.isSelected && !oldWidget.isSelected) {
      _controller.forward();
    } else if (!widget.isSelected && oldWidget.isSelected) {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Color get backgroundColor {
    if (widget.isBooked) return const Color(0xFFD32F2F); // red
    if (widget.isSelected) return kPrimaryColor; // orange
    return kSoftBackground; // light gray
  }

  Color get borderColor {
    if (widget.isSelected) return kPrimaryColor;
    return Colors.black.withOpacity(0.12);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (widget.isBooked) {
            showBookedPopup();
            return;
          }
          widget.onTap();
        },
      child: AnimatedBuilder(
        animation: _scaleAnim,
        builder: (_, child) {
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..rotateZ(-widget.angle * math.pi / 180)
              ..setEntry(3, 2, 0.001)
              ..rotateX(0.12),
            child: Container(
              width: widget.width * _scaleAnim.value,
              height: widget.height * _scaleAnim.value,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: borderColor,
                  width: widget.isSelected ? 3 : 1.2,
                ),
                boxShadow: widget.isSelected
                    ? [
                        BoxShadow(
                          color: kPrimaryColor.withOpacity(0.35),
                          blurRadius: 16,
                          spreadRadius: 4,
                        )
                      ]
                    : [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 6,
                          offset: const Offset(0, 4),
                        )
                      ],
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 6,
                    top: 6,
                    child: Text(
                      widget.id,
                      style: const TextStyle(
                        color: kTextGray,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Center(
                    child: Icon(
                      Icons.directions_car,
                      size: 32,
                      color: widget.isSelected || widget.isBooked
                          ? Colors.white
                          : Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// ======================== PAINTER (LANES + LINES) ===============

class ParkingPainter extends CustomPainter {
  final int rows;
  final int cols;
  final double unitW;
  final double unitH;

  ParkingPainter({
    required this.rows,
    required this.cols,
    required this.unitW,
    required this.unitH,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paintFloor = Paint()..color = Colors.white;
    final paintLane = Paint()..color = kSoftBackground;
    final paintLine = Paint()
      ..color = kTextGray.withOpacity(0.35)
      ..strokeWidth = 1.4;

    canvas.drawRect(Offset.zero & size, paintFloor);

    // draw horizontal lanes
    for (int r = 0; r <= rows; r++) {
      final top = 60 + r * unitH - unitH * 0.12;
      canvas.drawRect(
        Rect.fromLTWH(30, top, size.width - 60, unitH * 0.25),
        paintLane,
      );
    }

    // draw slot outlines
    for (int r = 0; r < rows; r++) {
      for (int c = 0; c < cols; c++) {
        final rect = Rect.fromLTWH(
          50 + c * unitW,
          60 + r * unitH,
          unitW * 0.9,
          unitH * 0.75,
        );

        canvas.drawRRect(
          RRect.fromRectAndRadius(rect, const Radius.circular(12)),
          paintLine,
        );
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
