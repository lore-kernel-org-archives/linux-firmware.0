Return-Path: <SRS0=Kklh=XK=oss.qualcomm.com=jeff.johnson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FDD1C369AB
	for <linux-firmware@archiver.kernel.org>; Thu, 24 Apr 2025 20:38:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2C14AC4CEE4; Thu, 24 Apr 2025 20:38:37 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 43120C4CEE3
	for <linux-firmware@kernel.org>; Thu, 24 Apr 2025 20:38:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 43120C4CEE3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OJmii7025476
	for <linux-firmware@kernel.org>; Thu, 24 Apr 2025 20:38:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3SyUdMW04qFzJTxNWJA3RW
	A/E6h9+fNCuPWqTh3yVPA=; b=P3g5oAkBsV1IAXrv8HnNnqAx+ErFnKAahxINog
	tGIaFdmAdSuSDV3FZ5quSVhVN2OX383ZTCVUlw507TfRBtah0KLnR+AyMnWop3Dh
	eFA92Ue/LFV/qfwyR1TUxsMG4vp8aopV8fBkLyRkyY8kNytNyRSv1fLOSeroDHFm
	yyXrahfbO9OScZDyndn5g6sVN4v5Dz+fpe2CkNlBC1nDZnTx83n9BtBi17S3D/TZ
	I4sHxi9D/7IoRLgoNAOKlkIh4I90olsIClgSkodnBoxXDqltbrvV8KVX3PZVIv0A
	AF6GAIVgA11PNLZiqSlyX2QEqBQh2vHK5H0+HdN69BU8XLsA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jgy6ue4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 24 Apr 2025 20:38:34 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-22c35bafdbdso20710505ad.1
        for <linux-firmware@kernel.org>; Thu, 24 Apr 2025 13:38:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745527113; x=1746131913;
        h=content-transfer-encoding:subject:cc:to:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3SyUdMW04qFzJTxNWJA3RWA/E6h9+fNCuPWqTh3yVPA=;
        b=jwnwW8BiCkTP/jFkB3gq0aFLa9AxZjiuNlwEnehxbuw0uPpHxYNx2lGHiIFzJwrgQ3
         sW7o1rYxGIh7lDlOIGpIRXI7AYayiqzyS8kbl63+1D5pGjOT6vs0G3y56yGv1trXy+6e
         faaNNUGYnblhSO/WsG/aSv3S/xeWZ1IjRr0vGwAVytNgjt/1E2Z/zHqrSWeSGIGVQBNq
         oSH3DLgdkl7eQB0qYry7akIAXXHwp1GH2UHvvkEC4EP/iru5FtJ0xKKeSs8ghGlZQhJ1
         q/FlhTCy8pSaQCzmYX5ooXv+0Z8d+YKr5KvlOAqddIPotXDgJHxbWuQ7Fh99luY59FwJ
         O75A==
X-Gm-Message-State: AOJu0Ywv0DPOShuYBWxj77yeUiiX/mRxhhKUODoRGpL8YTnj+iOigec1
	PPi1izS75XtfBZZFKa5hR6mFGVGSwTfQ4lg/W/2chUnU2C221YJ/W/jAWrGzfV3E8dUKwGoVCa7
	101wTFCwoW9UqKg2JP2estL9jnqLBW9sZZWZJkU5jjAXzvSGzuC2jFOJ8wBPI1sN3Sys=
X-Gm-Gg: ASbGnctS/vRQHESpu9Z7qSkgg70AkoeE+PIgo00h5TkA6WEufNTxZXcYUVEczLp1DVu
	2O7ukx+G+eeIPfgQFoOIe4kdML/KxAi/iWEfbr6nFmNd/3OuA9F1fSU0wsP8ywfZNkIoOCYnoGN
	XJ/hDDajwJZLLAUgz8Q3FTswIGRieu8XFaiUTq/jzAKzbsiN/5M5/IfUDxtuG4iAgo5Hv+BJ3j/
	k174H6WUCralwUaujWSxsQRqEVFvHL8PclH9aVj/+DjAmE7MNvisN6qbdmQkUqawa9NvM8yWSqg
	X7A377G/Ba2yHWQRVmq8YFODNkby5MCxz2kBL2R24IJ8BEDQZiYmRE65C0WnLF4wWQ1u2uAfhoz
	O3n2e
X-Received: by 2002:a17:903:1aa8:b0:224:23be:c569 with SMTP id d9443c01a7336-22dbd423f55mr14612055ad.22.1745527113291;
        Thu, 24 Apr 2025 13:38:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOssOO9EMlEhSWXpnlt0d7EeCfY5WHRuv9lpuIv/YQVdg/51RxVXr3vI3U4gwYL/f1Cu9COw==
X-Received: by 2002:a17:903:1aa8:b0:224:23be:c569 with SMTP id d9443c01a7336-22dbd423f55mr14611775ad.22.1745527112895;
        Thu, 24 Apr 2025 13:38:32 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db50e7a8dsm18088275ad.136.2025.04.24.13.38.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 13:38:32 -0700 (PDT)
Message-ID: <96b43d18-72e1-44a8-bf06-6a22fd012b07@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 13:38:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org
Subject: [PULL linux-firmware] ath11k and ath12k firmware 20250424
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDE0NSBTYWx0ZWRfX/yTPywGqctpL VjzwjOIiCCVPUWzXEY7Dp0ITIWJoP8AqZB/CVxeUq63hlrVpuut0150TwvTZJWm8qGsiyRw3MS5 PRSayem0f9cQXGo2Ic96w1lyguVfaYYUjKBB678EUbZPr7qX709B2nSpnU17VPQ7cMIfaJNhP8z
 34wkQTq40II1WDAm25EDf/9H0ilkT7VXuL7m0StQ02uk1Jxd9KkjDE/UpIsKhaQg098P//VSaiz y2DOlf0jdHVjFa5WADTk97qeuAJX0dEEAx0I6YA8qL+KQX2c8izS9Bq61NkbLp8QkZTEGr5MVW6 ceEF8IWEsUkGW/JgKfTxi2+rGsG1QXAT5PzB0DW13TzojD+/hByZxa9kEZMIzTHvBodyHxDdvXb
 28MPqQKLfzuVZcYXYn8aH/CQpN5A+BwAiG4GNbBDahAIhOSjOhRpzlvlOTbSqEySi6gXqCT7
X-Proofpoint-GUID: TkkHObnxYp5M93V1ETuAGvUAL6TO81DS
X-Proofpoint-ORIG-GUID: TkkHObnxYp5M93V1ETuAGvUAL6TO81DS
X-Authority-Analysis: v=2.4 cv=M5VNKzws c=1 sm=1 tr=0 ts=680aa14a cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=e70TP3dOR9hTogukJ0528Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=c5pCFXJUQfKAI649l18A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-24_09,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=819 malwarescore=0 impostorscore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240145

Hi,
Here's a new pull request for ath11k and ath12k.

For ath11k, update the firmware for IPQ5018 and update the board file
for WCN6855. For ath12k, update the firmware for WCN7850 and update
the board file for QCN9274.

Please let me know if there are any problems.

/jeff

The following changes since commit 490c0af1d6b9ffca0523edcfad27ba483b9d6da3:

  Merge branch 'robot/pr-0-1745490027' into 'main' (2025-04-24 13:46:05 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20250424

for you to fetch changes up to ce13d29c3933f77674cf45855668485c48d3eba0:

  ath11k: WCN6855 hw2.0: update board-2.bin (2025-04-24 13:04:20 -0700)

----------------------------------------------------------------
Jeff Johnson (4):
      ath12k: QCN9274 hw2.0: update board-2.bin
      ath12k: WCN7850 hw2.0: update to WLAN.HMT.1.1.c5-00284-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
      ath11k: IPQ5018 hw1.0: update to WLAN.HK.2.6.0.1-01300-QCAHKSWPL_SILICONZ-1
      ath11k: WCN6855 hw2.0: update board-2.bin

 WHENCE                           |    4 +-
 ath11k/IPQ5018/hw1.0/Notice.txt  | 3918 +++-----------------------------------
 ath11k/IPQ5018/hw1.0/q6_fw.b00   |  Bin 532 -> 532 bytes
 ath11k/IPQ5018/hw1.0/q6_fw.b01   |  Bin 520 -> 520 bytes
 ath11k/IPQ5018/hw1.0/q6_fw.b04   |  Bin 86788 -> 86788 bytes
 ath11k/IPQ5018/hw1.0/q6_fw.b08   |  Bin 4096 -> 4096 bytes
 ath11k/IPQ5018/hw1.0/q6_fw.b09   |  Bin 2334720 -> 2334720 bytes
 ath11k/IPQ5018/hw1.0/q6_fw.b10   |  Bin 269220 -> 269252 bytes
 ath11k/IPQ5018/hw1.0/q6_fw.b11   |  Bin 99456 -> 99456 bytes
 ath11k/IPQ5018/hw1.0/q6_fw.b13   |  Bin 7072 -> 7080 bytes
 ath11k/IPQ5018/hw1.0/q6_fw.mdt   |  Bin 1052 -> 1052 bytes
 ath11k/WCN6855/hw2.0/board-2.bin |  Bin 6429240 -> 6429240 bytes
 ath12k/QCN9274/hw2.0/board-2.bin |  Bin 1308544 -> 2626240 bytes
 ath12k/WCN7850/hw2.0/amss.bin    |  Bin 6000704 -> 6082624 bytes
 ath12k/WCN7850/hw2.0/m3.bin      |  Bin 299660 -> 299660 bytes
 15 files changed, 315 insertions(+), 3607 deletions(-)
