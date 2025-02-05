Return-Path: <SRS0=HjUF=U4=oss.qualcomm.com=jeff.johnson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F0F2C02192
	for <linux-firmware@archiver.kernel.org>; Wed,  5 Feb 2025 19:42:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C42F6C4CEE4; Wed,  5 Feb 2025 19:42:39 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 59780C4CED1
	for <linux-firmware@kernel.org>; Wed,  5 Feb 2025 19:42:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 59780C4CED1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 515GqfUp029406
	for <linux-firmware@kernel.org>; Wed, 5 Feb 2025 19:42:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=U89NaUs2hFzdVum9QFeTZv
	vj2h4vjXk6YXjDwpodyZg=; b=gOBngM1UmtXsNXEgRTgC+F06435D+fmXvuvhZK
	6msXg54TYygMRm75x1lriXI+4G/0VcAgmoDI0BeqoBMBEkAn4j1hpfZkKeDsjyIW
	Ed0ry1jEi3QHzL2Tk0Z4ALS699NpnJD9QyTVx5EtjtAi/7A/Dgs0lVuhULe4ajaB
	k1y45DqI1cgWdfhtcpAs/aohoWnxYRFR5KpnPrZBuaZ1HVvYH1LD+2he+bR5qm5Z
	wWNyQu6mxHI9Z41yGvYeT96wbO+3G1y9bLD+UugXJjdJw14LiBPg8gJ9aRDFesaf
	ULLReFsySSU1iQ9nn1QzRH5dvBIuLfJZ5oKukQKj8glv5x6w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44mbw48dsf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 05 Feb 2025 19:42:36 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2f9c02f54f2so122481a91.3
        for <linux-firmware@kernel.org>; Wed, 05 Feb 2025 11:42:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738784555; x=1739389355;
        h=content-transfer-encoding:subject:cc:to:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U89NaUs2hFzdVum9QFeTZvvj2h4vjXk6YXjDwpodyZg=;
        b=fvxu5lXT62bWmoGj7WF7edghvv4Hb+Af1d3/uIsNkxO9qrG7RrkKjrSEvNaGpgXjMu
         VhudfNtONQxtsZuCl+OUCwHOdCkiLnFGwuSCBQw3ikawQrxsDiZD9Yc9VnTJNB0KhkcR
         eeCa2p9cda+qr59XvKtvmDt0I2iZs4ycMaoAZmU3at1j/cbh9BTm9qcWHUAF8jWqXsyf
         qpAGPElwb7wjU4Rs8Rd9TpOTbXTBlvLRV5K1R9lu2ncPzPzMf/gniNUCdNyL5nY293yF
         F3O10HfIqMiBfNdiYw0xxpNW9zdU1c05pli8amy44VJqVjS4jIlh3GRdAX4OdtxM+bmJ
         RgMQ==
X-Gm-Message-State: AOJu0YymBHYbZiNGYSlK/tpu1p1tt+s3k9Ep0/1tsTfdGtuFORU5EVXd
	h946rNvAhXSGn8xxcu0fZe+aU7kAO4FBAlq5Wy4EI1amkFMZWah1+pqKi2WTULzm5dc7x60l46W
	yf2hm3K9X2Dfgp7TKoAO/y01xomBt9yFe0hbxN9A714L2n8xHy1q5EW/4xzdmAaaSxFc=
X-Gm-Gg: ASbGncvf8wgF73h5dxOJdEZVnwM0HmOjVbvxznUJuwrvgAAAAf0FXS4zOLg70aShMcW
	10y6JDW11gvOGvQbDnDqNd9xLTUmORkaTsXRhJY2cTDjb1L1Q72JxwunJ8Kl8QLqTMWDBw53rZd
	FdUPelW2lJef+kfINIMKZcIJnUy6tdiM5455CLulw5vnwIUUlBgN7Q9wJM7CO8LsgxsfGgA/Tcd
	lc96ljw3ladGxXWAJxSKzNPKCg8X8AfTS0YDHSz/6LUrJg9dhTVeHxuO/MZEOUZ0NgSSTbmTt54
	ZdqhKneI/rGJ271SLDoN+WyC15mAAJCn+dKZ3ZzR4lLbzvPgVv5fT89NbGcX
X-Received: by 2002:a17:90b:52c7:b0:2f8:4a3f:dd2d with SMTP id 98e67ed59e1d1-2f9e07846b9mr6703876a91.15.1738784555060;
        Wed, 05 Feb 2025 11:42:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF940SS5ltAjpQDKtK9E1zhSwIPpVcHL52+Reu9zJb0T1PN07OyPNgW0Um7KDFL1mJymnS5dQ==
X-Received: by 2002:a17:90b:52c7:b0:2f8:4a3f:dd2d with SMTP id 98e67ed59e1d1-2f9e07846b9mr6703834a91.15.1738784554649;
        Wed, 05 Feb 2025 11:42:34 -0800 (PST)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f9e1d89b9csm1978812a91.27.2025.02.05.11.42.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 11:42:34 -0800 (PST)
Message-ID: <9be8cab2-02d0-40d2-b69f-7cb3095249a9@oss.qualcomm.com>
Date: Wed, 5 Feb 2025 11:42:33 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PULL linux-firmware] ath11k and ath12k firmware 20250205
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: qUJpBDi1vh3PP8bkTDPxQd7HsvNgK7gM
X-Proofpoint-ORIG-GUID: qUJpBDi1vh3PP8bkTDPxQd7HsvNgK7gM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-05_06,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 priorityscore=1501 spamscore=0 mlxlogscore=893 malwarescore=0 adultscore=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 impostorscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502050150

Hi,
Here's a new pull request for ath11k and ath12k.
This includes new ath11k support for QCA6698AQ, updated ath11k board support
for the Qualcomm Robotics RB3 gen2 platform [1], and some board and firmware
upgrades for other ath11k and ath12k hardware.

Please let me know if there are any problems.

/jeff

[1] https://msgid.link/CAA8EJpq=QRbWe6KTxcmHkHp20rgEgLZeGYV7+Hy2Qkfo_MyV1g@mail.gmail.com

The following changes since commit 7ac1fc5f254d8d97a1aa96360c23f0659addb047:

  Merge branch 'make-deb-fix-no-such-file-error' into 'main' (2025-02-04 12:31:31 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20250205

for you to fetch changes up to 99720d02248f775f952a97455ea3b3a687196a50:

  ath12k: WCN7850 hw2.0: update board-2.bin (2025-02-05 11:26:43 -0800)

----------------------------------------------------------------
Jeff Johnson (12):
      ath11k: IPQ6018 hw1.0: update to WLAN.HK.2.7.0.1-02409-QCAHKSWPL_SILICONZ-1
      ath11k: IPQ8074 hw2.0: update to WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
      ath11k: QCA2066 hw2.1: update board-2.bin
      ath11k: QCA2066 hw2.1: update to WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.6
      ath11k: QCA6390 hw2.0: update board-2.bin
      ath11k: QCA6698AQ hw2.1: add board-2.bin
      ath11k: QCA6698AQ hw2.1: add to WLAN.HSP.1.1-04479-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1
      ath11k: QCN9074 hw1.0: update to WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
      ath11k: WCN6750 hw1.0: update board-2.bin
      ath12k: QCN9274 hw2.0: update board-2.bin
      ath12k: QCN9274 hw2.0: update to WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
      ath12k: WCN7850 hw2.0: update board-2.bin

 WHENCE                              |   15 +-
 ath11k/IPQ6018/hw1.0/Notice.txt     |  419 ++--
 ath11k/IPQ6018/hw1.0/m3_fw.b01      |  Bin 6712 -> 6712 bytes
 ath11k/IPQ6018/hw1.0/m3_fw.mdt      |  Bin 6860 -> 6860 bytes
 ath11k/IPQ6018/hw1.0/q6_fw.b00      |  Bin 340 -> 340 bytes
 ath11k/IPQ6018/hw1.0/q6_fw.b01      |  Bin 7000 -> 7000 bytes
 ath11k/IPQ6018/hw1.0/q6_fw.b02      |  Bin 4696 -> 4696 bytes
 ath11k/IPQ6018/hw1.0/q6_fw.b03      |  Bin 2602320 -> 2606416 bytes
 ath11k/IPQ6018/hw1.0/q6_fw.b04      |  Bin 386016 -> 386528 bytes
 ath11k/IPQ6018/hw1.0/q6_fw.b05      |  Bin 202532 -> 202532 bytes
 ath11k/IPQ6018/hw1.0/q6_fw.b07      |  Bin 9912 -> 9912 bytes
 ath11k/IPQ6018/hw1.0/q6_fw.b08      |  Bin 464564 -> 467388 bytes
 ath11k/IPQ6018/hw1.0/q6_fw.mdt      |  Bin 7340 -> 7340 bytes
 ath11k/IPQ8074/hw2.0/Notice.txt     |  419 ++--
 ath11k/IPQ8074/hw2.0/m3_fw.b01      |  Bin 136 -> 136 bytes
 ath11k/IPQ8074/hw2.0/m3_fw.b02      |  Bin 327680 -> 327680 bytes
 ath11k/IPQ8074/hw2.0/m3_fw.mdt      |  Bin 284 -> 284 bytes
 ath11k/IPQ8074/hw2.0/q6_fw.b00      |  Bin 340 -> 340 bytes
 ath11k/IPQ8074/hw2.0/q6_fw.b01      |  Bin 328 -> 328 bytes
 ath11k/IPQ8074/hw2.0/q6_fw.b02      |  Bin 4696 -> 4696 bytes
 ath11k/IPQ8074/hw2.0/q6_fw.b03      |  Bin 2978704 -> 3215248 bytes
 ath11k/IPQ8074/hw2.0/q6_fw.b04      |  Bin 982944 -> 1000480 bytes
 ath11k/IPQ8074/hw2.0/q6_fw.b05      |  Bin 248260 -> 254596 bytes
 ath11k/IPQ8074/hw2.0/q6_fw.b07      |  Bin 10112 -> 9960 bytes
 ath11k/IPQ8074/hw2.0/q6_fw.b08      |  Bin 504104 -> 596768 bytes
 ath11k/IPQ8074/hw2.0/q6_fw.mdt      |  Bin 668 -> 668 bytes
 ath11k/QCA2066/hw2.1/amss.bin       |  Bin 5349376 -> 5349376 bytes
 ath11k/QCA2066/hw2.1/board-2.bin    |  Bin 685144 -> 685144 bytes
 ath11k/QCA6390/hw2.0/board-2.bin    |  Bin 115984 -> 173980 bytes
 ath11k/QCA6698AQ/hw2.1/Notice.txt   | 3658 +++++++++++++++++++++++++++++++++++
 ath11k/QCA6698AQ/hw2.1/amss.bin     |  Bin 0 -> 5132288 bytes
 ath11k/QCA6698AQ/hw2.1/board-2.bin  |  Bin 0 -> 866120 bytes
 ath11k/QCA6698AQ/hw2.1/m3.bin       |  Bin 0 -> 266684 bytes
 ath11k/QCN9074/hw1.0/Notice.txt     |  419 ++--
 ath11k/QCN9074/hw1.0/amss.bin       |  Bin 3963336 -> 4227408 bytes
 ath11k/QCN9074/hw1.0/m3.bin         |  Bin 340108 -> 340108 bytes
 ath11k/WCN6750/hw1.0/board-2.bin    |  Bin 843548 -> 927980 bytes
 ath12k/QCN9274/hw2.0/board-2.bin    |  Bin 292160 -> 1308544 bytes
 ath12k/QCN9274/hw2.0/firmware-2.bin |  Bin 15224888 -> 15392824 bytes
 ath12k/WCN7850/hw2.0/board-2.bin    |  Bin 1897968 -> 1986952 bytes
 40 files changed, 4136 insertions(+), 794 deletions(-)
 create mode 100644 ath11k/QCA6698AQ/hw2.1/Notice.txt
 create mode 100644 ath11k/QCA6698AQ/hw2.1/amss.bin
 create mode 100644 ath11k/QCA6698AQ/hw2.1/board-2.bin
 create mode 100644 ath11k/QCA6698AQ/hw2.1/m3.bin
