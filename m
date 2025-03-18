Return-Path: <SRS0=+nZ8=WF=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89CC4C35FF3
	for <linux-firmware@archiver.kernel.org>; Tue, 18 Mar 2025 21:12:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4E809C4CEEF; Tue, 18 Mar 2025 21:12:50 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 34864C4CEDD
	for <linux-firmware@kernel.org>; Tue, 18 Mar 2025 21:12:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 34864C4CEDD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52IHCZZn003894
	for <linux-firmware@kernel.org>; Tue, 18 Mar 2025 21:12:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=k+yq6v8v3HHnAum7+7jnCtPk
	0HsxZODrvCK8fT5xb+E=; b=iQaRTLZOclPewR9kCIWtctFH912QbaM4wa3W22Qd
	ZR9caZsW4SqVx/pe+JyY3VYV4a2tgn46KBV68rFXLZxfp4Fh3SfP4JRyPcNjZYQn
	6YDD6j40GN+Y2jNjy5iN6fKUYTKt6kZJCFmWM/1udW+T1ZO4YBCd1eSOHl+KvxAg
	NytjF2agXlspJ0Iq4aiAIuxXJJjnPDQw0rTcMBl4DWOw44W3W6KJvIBonpFfoKT1
	VeIyv8LmT9EiiF9jA7RPz+DTaTexBJ07oZ7SWigt7rkN75c3tPkjTZsmsHtveB5V
	YgkXIvT9uWk1RPe97XFqTapWopLXVhNDeyFFeVMmWU6r9g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45fd1dghfr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 18 Mar 2025 21:12:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c0c1025adbso1444237085a.1
        for <linux-firmware@kernel.org>; Tue, 18 Mar 2025 14:12:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742332366; x=1742937166;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k+yq6v8v3HHnAum7+7jnCtPk0HsxZODrvCK8fT5xb+E=;
        b=jzpXMbMdSWm2ZXWXh2D37GQJGLUpwr9JICfDwy/BGWxE/QAahtOqZGpQ/YoktWZ+tD
         G26lX3tNLgixMd5CoIFc6590xPdpo/S61lVW4SgEE6P15ThYwR1xZhaWDXOmFWHlXl7F
         zPRmkJd3pFz/T408PE1xPAh16/TG99mysm6gYtAeD705sayjuglLokmbSVLGtzogtdMJ
         sUI8Vc+GY8dydHgKibJ6CWARVqLnwUpMAdrueVcGhUEj07q7/x7qHIFBH3nDcQj+KTRN
         cwO+Z+kN2K6UTIDMeGSspMZzFo1FDa4veqDZ3RIOr5ETYa/OwnvPqCR8Y3cM/sevM/tU
         Y0xg==
X-Gm-Message-State: AOJu0Yx+Swwhr9Zm6plJDoQqEg3Ssmqzjf6r5PX/XE5ZGucMpqnx6fLw
	BY2220Pv4IceUi5/GG7ODN6V5iHwJaacdzjiazTcyXKH2Ys1me9kfPIsTQAr/z3JbSiq9eXFdJd
	QlwZDN5b2+TivkXkudz7PTXCYuUsN35RfMeIddQczfPKfe/TnGxq/j8yd9gKjI6ZFfDI=
X-Gm-Gg: ASbGnctezjcQ5om7wVPtvS/AzOT3a743ajrWKasItqyGxKqAoaniKVNey33hiCJwq3E
	l12uPn5xz1e/E/Hgopg1gPFXwNk71IOHQfVYPlhT960esnRG6SaRe4ejaqtVjxxcCpE2AeSruD9
	wNqxz2R+8CjDN8gt17v9m4Jdbn6sUEa71wTb46mdFQLjohWkGtog6zQKP6EjNroEB1OYwexaf+4
	8mZfJeRfJfrH4yzfj3TRxpVSO8LAt3/S30Y0NxMVEc9zoJ3l6GTdEFMigfIm9OgE91lJTZ9Nez8
	p2DYgkypxZTULX64LuoauBBH0wgP8cGO3F6PU0J28X76Px47NljGWp6B/076CgyDFKMKAAKF/C3
	C3+I=
X-Received: by 2002:a05:620a:2483:b0:7c5:5768:40b3 with SMTP id af79cd13be357-7c5a8469b3fmr21663985a.45.1742332366644;
        Tue, 18 Mar 2025 14:12:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnufZVz5gRlnk7AOYnKewS8LotM/XOXWouX0li3fq1egAx+1r9AfmpEv7nD0vj12zeT2h33w==
X-Received: by 2002:a05:620a:2483:b0:7c5:5768:40b3 with SMTP id af79cd13be357-7c5a8469b3fmr21661785a.45.1742332366307;
        Tue, 18 Mar 2025 14:12:46 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba882806sm1761383e87.191.2025.03.18.14.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 14:12:45 -0700 (PDT)
Date: Tue, 18 Mar 2025 23:12:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Georg Gottleuber <ggo@tuxedocomputers.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org,
        Christoffer Sandberg <cs@tuxedocomputers.com>,
        Werner Sembach <wse@tuxedocomputers.com>
Subject: Re: [PATCH] ath12k: WCN7850 hw2.0: update board-2.bin
Message-ID: <iffofcri7ah2pwu3b77z5zfsa2wkzl5mcoarm2any4fdcjvsys@o35roczyxb6q>
References: <398de7cb-e455-4cb4-98e8-31471bb740a6@tuxedocomputers.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <398de7cb-e455-4cb4-98e8-31471bb740a6@tuxedocomputers.com>
X-Proofpoint-ORIG-GUID: 73svJoiaJAAx_I2BKE00cJM209Lgvo2S
X-Proofpoint-GUID: 73svJoiaJAAx_I2BKE00cJM209Lgvo2S
X-Authority-Analysis: v=2.4 cv=T52MT+KQ c=1 sm=1 tr=0 ts=67d9e1cf cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=yDUiu3_GAAAA:8 a=vfnCp4mGswuaxUiX0_UA:9 a=CjuIK1q_8ugA:10 a=dK5gKXOJidcA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=gafEeHOdjwYkg5oUpzAY:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_09,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 mlxscore=0 clxscore=1011
 mlxlogscore=725 lowpriorityscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180153

On Tue, Mar 18, 2025 at 02:40:18PM +0100, Georg Gottleuber wrote:
> Added an additional board string with qca-swiss-army-knife:
> bus=pci,vendor=17cb,device=1107,subsystem-vendor=1eac,subsystem-device=8001,
> qmi-chip-id=2,qmi-board-id=255
> 
> Tested with 2.4GHz, 5GHz and 6GHz (iperf3 -t30 --bidir)


Please follow the process specified at the kernel wiki [1]. Otherwise
the next update by Jeff will revert your changes.

[1] https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath10k/boardfiles.html

> 
> Signed-off-by: Georg Gottleuber <ggo@tuxedocomputers.com>
> ---
>  ath12k/WCN7850/hw2.0/board-2.bin | Bin 1986952 -> 1987068 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)
> 
> diff --git a/ath12k/WCN7850/hw2.0/board-2.bin
> b/ath12k/WCN7850/hw2.0/board-2.bin
> index
> 48f18e23014c4a8d1d771c4bd1ed1ceda00a33ef..659acff5411e6f10accbf227b46088fa83ec0291
> 100644
> GIT binary patch
> delta 89
> zcmV-f0H*(lqj~(Jd4PlggaU*Egam{Iga(8Mgb0KQgbIWUgbaiYgbsucgb;)ggc5`k
> vgcO7ogcgJsgcyVwgc^h!v>f=90qB>ptr1g~OqCpV0WpV9l^nNEl^r>}c)}mC
> 
> delta 87
> zcmV-d0I2``qj`v<d4PlggaU*Egam{Iga(8Mgb0KQgbIWUgbaiYgbsucgb;)ggc5`k
> tgcO7ogcgJsgcyVwgc^h!v>f=90d$wKtr1g~OqCpVhc=cRw>Fj?#=AG9A7=mn
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
