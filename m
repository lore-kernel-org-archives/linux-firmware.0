Return-Path: <SRS0=fNjO=CU=oss.qualcomm.com=jeff.johnson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F844F8FA86
	for <linux-firmware@archiver.kernel.org>; Tue, 21 Apr 2026 14:36:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E76D5C2BCB3; Tue, 21 Apr 2026 14:36:14 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 28720C2BCB6
	for <linux-firmware@kernel.org>; Tue, 21 Apr 2026 14:36:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 28720C2BCB6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LCtPIQ1538502
	for <linux-firmware@kernel.org>; Tue, 21 Apr 2026 14:36:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DWPUc7al7seOtzF17+ZKNA
	mhSS/cjwEU4vt4ddqzkso=; b=iy++ZPrIOWmSzp9tyjXuKOP9e9KyDuuQpabMo1
	faj2cCewDGJeXhJ1+d5zhIyQw++CZDzl7A0VX6o8zpbw6pbjAD1o2BoCN2NxrGMJ
	37GvrFTiVLJeBjujIlT4UFCXgbc8vBbM5Ogp9muEds/6z4BtvfKJ3XSnPtgbWu6A
	LGzzFlfMW2uPHMbo+PWFqnYPejNTyDbgL2pz88GrOGmIuVKFdG9kjzXYFslQ4bXl
	w7VzJsczcpj0RLYIs2BG3AQXdfMMkPg8KiidoCNTUngOpFaQSma6I2JiYfGTsGzO
	aL8turnswMAap/7zX8qHTzT7qlbDPcLm2cFoKRH9TcNGJGVw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp4hahmv5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 21 Apr 2026 14:36:12 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2bdf75bc88fso5136664eec.0
        for <linux-firmware@kernel.org>; Tue, 21 Apr 2026 07:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776782172; x=1777386972; darn=kernel.org;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DWPUc7al7seOtzF17+ZKNAmhSS/cjwEU4vt4ddqzkso=;
        b=kPb2Eo45rK86gNfIsKY7me23eW3vkEQZtVlJy2NFcWfp2P2lfum/TLG9fEXvIzWtoA
         VoNIftdAmCUzVkXQKXQPMtufULKM2/12Hc9ea+CABlADFgEcU9uGbH0BU+DElsTGlWKE
         uaeypRFkt1ODZPM1c4spoP9ZvrSp+bmsx+NnbeTWWGhk1oJgLZ4t+9HWqYytrkZL2SpE
         oZlIyF+bDlNXektbhHls0xIGF5F5xgLAThHEzxKbQ9abwvTuB8T49VcqY2vDKuIz8e4f
         96ilDbxpbVTpNM9Eg3vm4SUOUJ9g9dvoK82FvFaz08VJhuTgLjSCj9CBewPmn35eCcd4
         18GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776782172; x=1777386972;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DWPUc7al7seOtzF17+ZKNAmhSS/cjwEU4vt4ddqzkso=;
        b=GaGdEZvPeqpQO1enlO9cHM+iLnMCxwLvdEfZlmAME3Z4HqB9v9mTy/vMtnWB0vDOBE
         wajjddVre7IpNeCDLezUFHaReiijxef6puVWc1BZcgodTxpLkrNuV/zisFFu24np/Icn
         pDhwpxArJxGdYyjeP2qP+nqbTEZIxjQ7d9geS6tAviyht7zb3H/xBq1R8Fegtm6FDUbo
         p1u68ZU2iL6SF7s2L9zyKcGRADXQlWoAiwwx2OqXGkjbtcSz9kog35nsFNG9Q5uCX+c/
         1jjlNzh0ziVvezeIMpRYdxnF2Xknc/Y8Gle4mnD7EIE6obRlGXIu+z/zdERBJNVugnoR
         RqTw==
X-Gm-Message-State: AOJu0YyjTdEYAdY7Zy65etLZGb5gWgq2sgO99O84CJRK3caLTUGHp5rV
	RwtzbnHhQw39oarcpMtjZ33AUpknqCC0aIHqVCFbGpCf5FRYKbMyZhtgKKT5yfyCJ5Gb1nz+D/C
	rZYDjgCXYjoxkLcCoz7b2BO85xmKIzkg0YnUk6vPMPiA5mSXLXyc11XtGwZZrvEyBkktvsYc=
X-Gm-Gg: AeBDietHl34YTUlCBEytC21olOM59wify9gW6Gia8F1yzvAhGZn3f0VAHMosbyuu6k2
	gnzg9liYmB07DKbY8acjN550rWWoj3iGOOhBBtS9eILD9zzY31cQxSbiarmuEc8zOSKRgxVBGa8
	pj0IlFQMq+A0j4svhMP0tFLvkWUIOjDKaQnX6z9X4CHpTNRZbZAJpJS9jhnnNEhzWffrAxOgh+R
	8ocdexYK6A15BOXtnfIrmemSL/ja8rabpyTyCPv5gSXgHzpKOG9pqGEBOfRIbjKuFO21iDvJMn3
	6RapEYxBcIMdZBcXAOTxUCoX+SrBezT8c8KeUYnx4I2W4zKX7E9k1F4V2+iuTpkvxXLGzpggrxC
	ZNtlJqBXzcvji1nULKXf3y61G7OsvUeJ/zI/fqCNo7qjC2zmc1/Nfc+7qnN317zL3um6B
X-Received: by 2002:a05:7301:4704:b0:2e6:e77d:7bcf with SMTP id 5a478bee46e88-2e6e77d7e0fmr4635754eec.22.1776782171424;
        Tue, 21 Apr 2026 07:36:11 -0700 (PDT)
X-Received: by 2002:a05:7301:4704:b0:2e6:e77d:7bcf with SMTP id 5a478bee46e88-2e6e77d7e0fmr4635728eec.22.1776782170740;
        Tue, 21 Apr 2026 07:36:10 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c74a18a2bsm28627176c88.10.2026.04.21.07.36.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 07:36:10 -0700 (PDT)
Message-ID: <b581cc04-f5cd-4e99-9251-523e50623b03@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 07:36:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org
Subject: [PULL linux-firmware] ath10k, ath11k and ath12k firmware ath-20260421
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bOQm5v+Z c=1 sm=1 tr=0 ts=69e78b5c cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=Ulex03xzRqfrDqNhIRAA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: xdqg_cTMLt8kPFXCGEybsBgv6Eioi6hF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDE0NSBTYWx0ZWRfXw61eHvEBeEMm
 xzvC3KSPRHWTEFf0I2Kw2w6aNgovOj0CBZ2OxTgbhGb3MPDdSJjuCsJTZRQg0rV+J0hpl9VdUqL
 GwsZOLx/ObOAriruwE2CSPYuAa5FrECvYyIFsma/LLj+1MSNqL66yLr77RQJfw+gDnUNpwUXNQh
 SXOTYJp1AYp/Vfx5swqApnH6XsA56CVEMtdQzDwEDBDzGGE1byZDLtRsHZ0wkq0QB5KBWy/A57I
 JEc55b9Sjx+o8njbDMhe8ace1tBAvjqhR8qbE2i99H0NP8hspntBWMxaSyFJIWu1j2gVNzG5Y8l
 MkQZ4PBm4B9wGoqrzdUK/JW+FLqKyPgm+RWR37gWA/HK+DxIGO4L6fcbZ226tx8LsrSuVipr9Xp
 SgzUgLOVuyibN7yzQDU0nP0crThWsQ5yDFbsxQYUChKfUoHqOMHomDTVskXxAQHeEO24blSxlOZ
 cJZO0VftinMJFBI8+fg==
X-Proofpoint-ORIG-GUID: xdqg_cTMLt8kPFXCGEybsBgv6Eioi6hF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210145

Hi,
Here's a new pull request for ath10k, ath11k and ath12k firmware.

There are no changes for ath10k or ath11k.
For ath12k, add the initial firmware and board files for IPQ5424 and QCC2072.

Please let me know if there are any problems.

Thanks,
/jeff
---

The following changes since commit 3fc7117bb925983bc39d7ba957ce5fafe1f65d41:

  Merge branch 'wcn6855' into 'main' (2026-04-17 13:57:51 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20260421

for you to fetch changes up to 5bd6cbb6ae899e81c1ac3f6915af05e26a354b51:

  ath12k: QCC2072 hw1.0: add to WLAN.COL.1.0.c2-00074-QCACOLSWPL_V1_TO_SILICONZ-1 (2026-04-21 07:06:36 -0700)

----------------------------------------------------------------
Jeff Johnson (4):
      ath12k: IPQ5424 hw1.0: add board-2.bin
      ath12k: IPQ5424 hw1.0: add to WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1
      ath12k: QCC2072 hw1.0: add board-2.bin
      ath12k: QCC2072 hw1.0: add to WLAN.COL.1.0.c2-00074-QCACOLSWPL_V1_TO_SILICONZ-1

 WHENCE                               |   11 +
 ath12k/IPQ5424/hw1.0/Notice.txt      | 3987 ++++++++++++++++++++++++++++++++++
 ath12k/IPQ5424/hw1.0/board-2.bin     |  Bin 0 -> 353740 bytes
 ath12k/IPQ5424/hw1.0/iu_fw.mbn       |  Bin 0 -> 348152 bytes
 ath12k/IPQ5424/hw1.0/q6_fw0.mbn      |  Bin 0 -> 878224 bytes
 ath12k/IPQ5424/hw1.0/q6_fw1.mbn      |  Bin 0 -> 5623872 bytes
 ath12k/IPQ5424/hw1.0/qdsp6sw_dtb.mbn |  Bin 0 -> 20404 bytes
 ath12k/QCC2072/hw1.0/Notice.txt      | 3386 +++++++++++++++++++++++++++++
 ath12k/QCC2072/hw1.0/board-2.bin     |  Bin 0 -> 401232 bytes
 ath12k/QCC2072/hw1.0/firmware-2.bin  |  Bin 0 -> 7111860 bytes
 10 files changed, 7384 insertions(+)
 create mode 100644 ath12k/IPQ5424/hw1.0/Notice.txt
 create mode 100644 ath12k/IPQ5424/hw1.0/board-2.bin
 create mode 100644 ath12k/IPQ5424/hw1.0/iu_fw.mbn
 create mode 100644 ath12k/IPQ5424/hw1.0/q6_fw0.mbn
 create mode 100644 ath12k/IPQ5424/hw1.0/q6_fw1.mbn
 create mode 100644 ath12k/IPQ5424/hw1.0/qdsp6sw_dtb.mbn
 create mode 100644 ath12k/QCC2072/hw1.0/Notice.txt
 create mode 100644 ath12k/QCC2072/hw1.0/board-2.bin
 create mode 100644 ath12k/QCC2072/hw1.0/firmware-2.bin
