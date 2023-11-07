import 'package:flutter/material.dart';

class StatusWidget extends StatelessWidget {
  final String status;
  final bool overDue;

  final Map<String, int> allStatus = <String, int>{
    "pending_payment": 0,
    "refunded": 1,
    "paid": 2,
    "preparing_purchase": 3,
    "shipping": 4,
    "delivered": 5
  };

  int get currentStatus => allStatus[status]!;

  StatusWidget({super.key, required this.status, required this.overDue});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _Statusdot(
          isActive: true,
          text: "Pedido confirmado",
        ),
        const _DividerCustom(),
        if (currentStatus == 1) ...[
          const _Statusdot(
            isActive: true,
            text: "Pix estornado",
            background: Colors.orange,
          ),
        ] else if (overDue) ...[
          const _Statusdot(
            isActive: true,
            text: "Pix vencido",
            background: Colors.red,
          )
        ] else ...[
          _Statusdot(
            isActive: currentStatus >= 2,
            text: "Pagamento",
          ),
          const _DividerCustom(),
          _Statusdot(
            isActive: currentStatus >= 3,
            text: "Preparando",
          ),
          const _DividerCustom(),
          _Statusdot(
            isActive: currentStatus >= 4,
            text: "Envio",
          ),
          const _DividerCustom(),
          _Statusdot(
            isActive: currentStatus == 5,
            text: "Entregue",
          ),
        ]
      ],
    );
  }
}

class _DividerCustom extends StatelessWidget {
  const _DividerCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      color: Colors.grey.shade300,
      width: 2,
      height: 10,
    );
  }
}

class _Statusdot extends StatelessWidget {
  const _Statusdot(
      {super.key, required this.isActive, required this.text, this.background});

  final bool isActive;
  final String text;
  final Color? background;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //circulo de status
        Padding(
          padding: const EdgeInsets.only(right: 5.0),
          child: Container(
            alignment: Alignment.center,
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.green),
              color: isActive ? background ?? Colors.green : Colors.transparent,
            ),
            child: isActive
                ? const Icon(
                    Icons.check,
                    size: 13,
                    color: Colors.white,
                  )
                : const SizedBox.shrink(),
          ),
        ),
        Expanded(
            child: Text(
          text,
          style: TextStyle(fontSize: 12),
        ))
      ],
    );
  }
}
