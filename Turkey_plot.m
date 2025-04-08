close all;
addpath('E:\李婷\土耳其地震\论文对比观测数据和模拟结果');
load('230206_1030_4MHz_f.mat')
load('dopper_simulation.mat')
load('PRAseisdata_xyz.mat')
load('seis_simulation.mat')
h=figure(2);set(h, 'Position', [100, 10, 600, 750]);LineWidth1=1.5;LineWidth2=1.5;
subplot(4,1,1);
xlim1=[0,1500]; ylim1=[-1,1]*20;
f_Nyquist      = 1/3/2;
freq_L         = 0.005;
freq_H         = 0.1;
filter_order   =  2;
seismic_filt_z = function_butter_filter_2018(X230206_1030_4MHz_f(:,4),freq_L,freq_H,f_Nyquist,filter_order,'bandpass');
seismic_z_v=-seismic_filt_z*3e8/(2*4.65e6*(sin(65/180*pi))^2)*10e6/sqrt((10e6)^2+(2.68e11*2*pi/700/30)^2);
[AX,H1,H2] = plotyy(X230206_1030_4MHz_f(:,1)+301,-seismic_z_v, dopper_simulation(:,1), dopper_simulation(:,2),'plot');
subtitle('(a) Doppler sounder -153km');
set(AX(1),'XColor','k','YColor','k','xlim',xlim1,'ylim',ylim1); set(H1,'color','k');
set(AX(2),'XColor','r','YColor','r','xlim',xlim1,'ylim',ylim1); set(H2,'color','r');
set(AX(1), 'YTick', [-40,-20,0,20,40]);
set(AX(1), 'YTickLabel', {'-40', '-20', '0', '20', '40'});
set(AX(2), 'YTick', [-40,-20,0,20,40]); 
set(AX(2), 'YTickLabel', {'-40', '-20', '0', '20', '40'});
set(H1, 'LineWidth', LineWidth1);set(H2, 'LineWidth', LineWidth2);
text(700,10,'P-AGW');text(940,10,'S-AGW');text(1070,15,'R');
HH1=get(AX(1),'Ylabel'); set(HH1,'String','observed v_z (m/s)'); set(HH1,'color','k');
HH1=get(AX(2),'Ylabel'); set(HH1,'String','Syntheitc v_z (m/s)'); set(HH1,'color','r');


subplot(4,1,2); ylim1=[-1,1]*1e-3;
t_observe = PRAseisdata_xyz{1,1}(:,1);
f_Nyquist      = 1/(t_observe(2)-t_observe(1))/2;
freq_L         = 0.005;
freq_H         = 0.1;
filter_order   = 2;
seismic_filt = function_butter_filter_2018(PRAseisdata_xyz{1,1}(:,2),freq_L,freq_H,f_Nyquist,filter_order,'bandpass');
[AX,H1,H2] = plotyy(PRAseisdata_xyz{1,1}(:,1),seismic_filt, seis_simulation(:,1), seis_simulation(:,2),'plot'); 
subtitle('(b) PRA seismic station 0.0001m v_x');
set(AX(1),'XColor','k','YColor','k','xlim',xlim1,'ylim',ylim1); set(H1,'color','k');
set(AX(2),'XColor','r','YColor','r','xlim',xlim1,'ylim',ylim1); set(H2,'color','r');
set(H1, 'LineWidth', LineWidth1);set(H2, 'LineWidth', LineWidth2);
text(260,0.3e-3,'P');text(480,0.3e-3,'S');text(540,0.8e-3,'Rayleigh');
set(findall(gcf,'-property','FontSize'),'FontSize',10);
HH1=get(AX(1),'Ylabel'); set(HH1,'String','observed v_x (m/s)'); set(HH1,'color','k');
HH1=get(AX(2),'Ylabel'); set(HH1,'String','Syntheitc v_x (m/s)'); set(HH1,'color','r');

subplot(4,1,3); 
seismic_filt = function_butter_filter_2018(PRAseisdata_xyz{1,2}(:,2),freq_L,freq_H,f_Nyquist,filter_order,'bandpass');
[AX,H1,H2] = plotyy(PRAseisdata_xyz{1,2}(:,1),seismic_filt, seis_simulation(:,1), seis_simulation(:,3),'plot'); 
subtitle('(c) PRA seismic station 0.0001m v_y');
set(AX(1),'XColor','k','YColor','k','xlim',xlim1,'ylim',ylim1); set(H1,'color','k');
set(AX(2),'XColor','r','YColor','r','xlim',xlim1,'ylim',ylim1); set(H2,'color','r');
set(H1, 'LineWidth', LineWidth1);set(H2, 'LineWidth', LineWidth2);
text(260,0.3e-3,'P');text(480,0.3e-3,'S');text(540,0.8e-3,'Rayleigh');set(findall(gcf,'-property','FontSize'),'FontSize',10);
HH1=get(AX(1),'Ylabel'); set(HH1,'String','observed v_y (m/s)'); set(HH1,'color','k');
HH1=get(AX(2),'Ylabel'); set(HH1,'String','Syntheitc v_y (m/s)'); set(HH1,'color','r');

subplot(4,1,4); 
seismic_filt = function_butter_filter_2018(PRAseisdata_xyz{1,3}(:,2),freq_L,freq_H,f_Nyquist,filter_order,'bandpass');
[AX,H1,H2] = plotyy(PRAseisdata_xyz{1,3}(:,1),-seismic_filt, seis_simulation(:,1), seis_simulation(:,4),'plot'); 
subtitle('(d) PRA seismic station 0.0001m v_z');
set(AX(1),'XColor','k','YColor','k','xlim',xlim1,'ylim',ylim1); set(H1,'color','k');
set(AX(2),'XColor','r','YColor','r','xlim',xlim1,'ylim',ylim1); set(H2,'color','r');
set(H1, 'LineWidth', LineWidth1);set(H2, 'LineWidth', LineWidth2);
text(260,0.3e-3,'P');text(480,0.3e-3,'S');text(540,0.8e-3,'Rayleigh');set(findall(gcf,'-property','FontSize'),'FontSize',10);
HH1=get(AX(1),'Ylabel'); set(HH1,'String','observed v_z (m/s)'); set(HH1,'color','k');
HH1=get(AX(2),'Ylabel'); set(HH1,'String','Syntheitc v_z (m/s)'); set(HH1,'color','r');
xlabel('Time (s)');






