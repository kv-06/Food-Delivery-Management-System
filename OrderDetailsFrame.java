/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */
package com.mycompany.food_delivery;

import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author karpa
 */
public class OrderDetailsFrame extends javax.swing.JFrame {
    private String orderId;
    OrderFrame prevframe;
    Connection con;
    Statement st;
    PreparedStatement ps;
    ResultSet rs;
    /**
     * Creates new form OrderDetailsFrame
     */
    public OrderDetailsFrame() {
        initComponents();
    }
    
    public OrderDetailsFrame(OrderFrame prevframe, String orderId) {
        initComponents();
        this.orderId = orderId;
        this.prevframe = prevframe;
         try{
            Class.forName("oracle.jdbc.OracleDriver");
            //JOptionPane.showMessageDialog(this,"Driver Loaded!");
            try 
            {
                //con = DriverManager.getConnection("jdbc:oracle:thin:@10.6.4.33:1521:orcl",
                //        "cse1054","ssn");
                con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl",
                        "user","pwd!");
                //JOptionPane.showMessageDialog(this,"Connected to Oracle database!");
            }
            catch (SQLException ex) 
            {
                Logger.getLogger(Customer.class.getName()).log(Level.SEVERE,null, ex);
                JOptionPane.showMessageDialog(this,ex.getMessage());
            }
        }
        catch(ClassNotFoundException ex){
        Logger.getLogger(Customer.class.getName()).log(Level.SEVERE,null, ex);
        JOptionPane.showMessageDialog(this,ex.getMessage());

        }
         customInitComponents();
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jScrollPane1 = new javax.swing.JScrollPane();
        detailsTable = new javax.swing.JTable();
        back = new javax.swing.JButton();
        totalLabel = new javax.swing.JLabel();
        jLabel1 = new javax.swing.JLabel();
        statlab = new javax.swing.JLabel();
        paylab = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        detailsTable.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null}
            },
            new String [] {
                "Item Name", "Qty", "Price", "Amount"
            }
        ));
        jScrollPane1.setViewportView(detailsTable);

        back.setText("Back");
        back.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                backActionPerformed(evt);
            }
        });

        totalLabel.setText("Total");

        jLabel1.setText("Order Details");

        statlab.setText("Status");

        paylab.setText("pay");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(53, 53, 53)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(totalLabel, javax.swing.GroupLayout.PREFERRED_SIZE, 182, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 441, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(0, 42, Short.MAX_VALUE))
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(back)
                .addGap(67, 67, 67))
            .addGroup(layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGap(233, 233, 233)
                        .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 97, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(layout.createSequentialGroup()
                        .addGap(95, 95, 95)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(paylab, javax.swing.GroupLayout.PREFERRED_SIZE, 155, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(statlab, javax.swing.GroupLayout.PREFERRED_SIZE, 142, javax.swing.GroupLayout.PREFERRED_SIZE))))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(29, 29, 29)
                .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 22, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 193, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addComponent(totalLabel)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 22, Short.MAX_VALUE)
                .addComponent(statlab)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(paylab)
                .addGap(20, 20, 20)
                .addComponent(back)
                .addGap(42, 42, 42))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void backActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_backActionPerformed
        // TODO add your handling code here:
        dispose(); // Close the current frame
        prevframe.setVisible(true);
    }//GEN-LAST:event_backActionPerformed

    private void customInitComponents() {
    // Fetch order details from the database
    List<OrderDetail> orderDetails = fetchOrderDetails();

    // Create a table to display order details
    String[] columnNames = {"Item Name", "Qty", "Price", "Amount"};
    Object[][] data = new Object[orderDetails.size()][4];

    double totalAmount = 0;
    String status = "";
    String payment = "";

    for (int i = 0; i < orderDetails.size(); i++) {
        data[i][0] = orderDetails.get(i).itemName;
        data[i][1] = orderDetails.get(i).quantity;
        data[i][2] = orderDetails.get(i).price;
        double amount = orderDetails.get(i).quantity * orderDetails.get(i).price;
        data[i][3] = amount;
        totalAmount += amount;
        status = orderDetails.get(i).status; // Assuming status is same for all items
        payment = orderDetails.get(i).payment; // Assuming payment is same for all items
    }

    detailsTable.setModel(new javax.swing.table.DefaultTableModel(
        data,
        columnNames
    ));

    totalLabel.setText("Total Amount: ₹" + totalAmount);
    statlab.setText("Status: " + status);
    paylab.setText("Payment: " + payment);
}


    private List<OrderDetail> fetchOrderDetails() {
    List<OrderDetail> details = new ArrayList<>();
    String query = "SELECT i.Item_name, ol.Qty, m.Price, o.Status, o.Payment " +
                   "FROM Order_list ol " +
                   "JOIN Items i ON ol.Item_id = i.Item_id " +
                   "JOIN Orders o ON o.Order_id = ol.Order_id " +
                   "JOIN Menu m ON m.Restaurant_id = o.Rest_id " +
                   "WHERE m.Item_id = i.Item_id AND ol.Order_id = ?";

    try {
        ps = con.prepareStatement(query);
        ps.setString(1, orderId);
        rs = ps.executeQuery();

        while (rs.next()) {
            String itemName = rs.getString("Item_name");
            int quantity = rs.getInt("Qty");
            double price = rs.getDouble("Price");
            String status = rs.getString("Status");
            String payment = rs.getString("Payment");

            details.add(new OrderDetail(itemName, quantity, price, status, payment));
        }
    } catch (SQLException ex) {
        ex.printStackTrace();
        Logger.getLogger(Customer.class.getName()).log(Level.SEVERE, null, ex);
        JOptionPane.showMessageDialog(this, ex.getMessage());
    }

    return details;
}

    
    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(OrderDetailsFrame.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(OrderDetailsFrame.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(OrderDetailsFrame.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(OrderDetailsFrame.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new OrderDetailsFrame().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton back;
    private javax.swing.JTable detailsTable;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JLabel paylab;
    private javax.swing.JLabel statlab;
    private javax.swing.JLabel totalLabel;
    // End of variables declaration//GEN-END:variables


class OrderDetail {
    String itemName;
    int quantity;
    double price;
    String status;
    String payment;

    OrderDetail(String itemName, int quantity, double price, String status, String payment) {
        this.itemName = itemName;
        this.quantity = quantity;
        this.price = price;
        this.status = status;
        this.payment = payment;
    }
}


}
