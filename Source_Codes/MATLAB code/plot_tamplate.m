hold off;
bits=[1:1:16];%unit:ns

accuracy4bits=[0.0982	0.0892	0.1032	0.1009	0.1130	0.9490	0.9520	0.9547	0.9525	0.9527	0.9532	0.9583	0.9528	0.9500	0.9515	0.9514
];

accuracyallbits=[0.8989	0.9120	0.9296	0.9430	0.9444	0.9512	0.9532	0.9559	0.9548	0.9569	0.9573	0.9550	0.9549	0.9559	0.9545	0.9555
];


L1=plot(bits, accuracy4bits);
hold on;
L2=plot(bits, accuracyallbits);

set(L1,'color','b','LineStyle','-','MarkerFaceColor','b','LineWidth',1);
set(L2,'color','r','LineStyle','-','MarkerFaceColor','r','LineWidth',1);

axis([0,16,0,1]);
set(gca,'xtick',[0:1:16]);
%set(gca,'ytick',[0:5:120]);
xlabel('#bit used to donate the weight','Fontsize',13);
set(gca,'yticklabel',{'0','10%', '20%', '30%', '40%' ,'50%','60%', '70%', '80%', '90%' ,'100%'});
%ylabel('output spiking period (ns)','Fontsize',13);
ylabel('Test Accuray %','Fontsize',13);
lgd=legend('rounding based on 4 bits after target bit','rounding based on all bits after target bit');
set(lgd,'Fontsize',14,'location','southeast');
title('Test accuray v.s. #bit round to','fontsize',14);
grid on;