package scribble;

import java.util.Map;
import java.util.Map.Entry;
import java.util.TreeMap;

public class Scribble {
    // private static final double G = 9.83;
    // private static final double G = 29;

    public static void main(String[] args) {
        // calculateG();
        printMpl();
        // calculateGFunction();
        // System.out.println(v(99d));
        // v2(1);
    }

    /**
     * v(12) ~= 0.86<br>
     * v(17) ~= 1.55<br>
     * v(21) ~= 2.2<br>
     * double b = (1.34 - 0.69 * (297d / 145d)) / (9d - 5d * (297d / 145d));<br>
     * double a = (0.69 - 5 * b) / 145d;<br>
     * double c = 0.86 - a * 144 - b * 12;<br>
     */
    private static double v(double x) {
        double b = 0.05905555555555542;
        double a = 0.0027222222222222266;
        double c = -0.24066666666666564;
        return a * x * x + b * x + c;
    }

    /**
     * v2(12)= 0.86<br>
     * v2(17)= 1.55
     */
    private static double v2(double x) {
        double a = 0.138;
        double b = -0.796;
        double x2 = a * x + b;
        return x2;
    }

    private static void calculateGFunction() {
        Map<Integer, Double> map = new TreeMap<Integer, Double>();
        map.put(12, 0.86);
        map.put(17, 1.55);
        map.put(21, 2.2);
        map.put(24, 2.85);
        for (Entry<Integer, Double> entry : map.entrySet()) {
            double ticks = entry.getKey();
            double velocity = entry.getValue();
            double time = ticks / 20d;
            double speed = velocity * 20d;
            double g = speed / time;
            System.out.println("Time = " + time);
            System.out.println("Speed = " + speed);
            System.out.println("G = " + g);
        }
        // v(12) = 0.86
    }

    private static int ACCURACY = 2; // ticks

    private static void printMpl() {
        for (int t = 2; t < 50; t += ACCURACY) {
            int averageT = t + (ACCURACY / 2);
            int maxT = t + ACCURACY - 1;
            double v = v(averageT);
            if (v < 0) {
                continue;
            }
            if (v > 10) {
                break;
            }
            for (int d = 0; d < 4; d++) {
                String motion;
                switch (d) {
                case 0:
                    motion = "Motion:[-" + v + ",0.0,0.0]";
                    break;
                case 1:
                    motion = "Motion:[0.0,0.0,-" + v + "]";
                    break;
                case 2:
                    motion = "Motion:[" + v + ",0.0,0.0]";
                    break;
                case 3:
                    motion = "Motion:[0.0,0.0," + v + "]";
                    break;
                default:
                    throw new RuntimeException();
                }
                // System.out.println(t + ":\t" + v);
                System.out
                        .println("/execute @a[score_ACV_TP_TO_min=0,score_ACV_VELOCITY_min="
                                + t
                                + ",score_ACV_VELOCITY="
                                + maxT
                                + "] ~ ~ ~ "
                                + "/execute @e[type=ArmorStand,name=ACV_PortalOut,r=0,c=1,score_ACV_DIRECTION_min="
                                + d
                                + ",score_ACV_DIRECTION="
                                + d
                                + "] ~ ~ ~ "
                                + "/summon ArmorStand ~ ~ ~ {CustomName:\"ACV_Velocity\",Tags:[\"new\"],"
                                + motion
                                + ",Invisible:1b,Invulnerable:1b,Marker:1b}");
            }
        }
    }

    private static void calculateG() {
        Map<Integer, Integer> map = new TreeMap<Integer, Integer>();
        // map.put(1, 4);
        // map.put(2, 6);
        // map.put(3, 8);
        // map.put(4, 9);
        // map.put(5, 11);
        // map.put(6, 12);
        // map.put(7, 13);
        // map.put(8, 14);
        // map.put(9, 15);
        // map.put(10, 16);
        // map.put(20, 23);
        // map.put(21, 24);
        // map.put(22, 25);
        // map.put(23, 25);
        // map.put(24, 26);
        // map.put(25, 26);
        // map.put(50, 39);
        // map.put(100, 59);
        // map.put(200, 92);
        // map.put(300, 121);
        // map.put(400, 148);
        // map.put(500, 175);
        for (Entry<Integer, Integer> entry : map.entrySet()) {
            double height = entry.getKey();
            double ticks = entry.getValue();
            double s = ticks / 20d;
            double g = 2 * height / (s * s);
            System.out.println(height + ":\t" + g);
        }
    }

}
