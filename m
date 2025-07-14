Return-Path: <SRS0=9QRH=Z3=oss.qualcomm.com=akhilpo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7BC7C83F1A
	for <linux-firmware@archiver.kernel.org>; Mon, 14 Jul 2025 17:25:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 89446C4CEF0; Mon, 14 Jul 2025 17:25:16 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A2074C4CEED
	for <linux-firmware@kernel.org>; Mon, 14 Jul 2025 17:25:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A2074C4CEED
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EGS76X030096
	for <linux-firmware@kernel.org>; Mon, 14 Jul 2025 17:25:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=q2b1x6NkPHVv67EJen7vqx
	r1sosllfoIm51ZlwgdJ3Y=; b=mlmjZtoRme0uLqZSxfoRWHBUQ31eYQugWXHMQ1
	XzNhJvgk4r8B7VARcHtH2KSPQSsjDcu/8DFX1yBlWzIeUN75EGyaNa0Zms9cdmib
	mjJfW+ygJR4GrXaExG4fv/TNjEPdz11hMEuCGHWr7tQ84DAjaJwTdlZY2GpvnVKI
	h3CupTs+KsnXREcA3OookSUHe/MzbO4AGMaKGgbO5z/W8Md5JckiSlhFntFIUiqH
	0ifVAAjjrhvE1MVdTrZ3Hhl+c4SyVqIWutOUkmIk9l5pgrjVXuWRvCDHIG9P95zl
	UHgtEJE0S8udAdEApWCaaVfiq21A+kJEN53HRxltalc6IzZQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dq052g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 14 Jul 2025 17:25:14 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-235196dfc50so45262775ad.1
        for <linux-firmware@kernel.org>; Mon, 14 Jul 2025 10:25:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752513908; x=1753118708;
        h=content-transfer-encoding:subject:cc:to:content-language:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q2b1x6NkPHVv67EJen7vqxr1sosllfoIm51ZlwgdJ3Y=;
        b=Olb93h4KCcQ0zDjZ8aQctQNd4snEJzOQESSEo6AOi/YWuvMpKAXnzFhAwcagmOvSEx
         155FffDfEjIRNzoUpCsQfiGqxELudMK4tx1hBS79nBWJMxxpKvweDMfwqDvw2CV7Apo/
         ixG+yVHEL0/69nsQrwEfwgAR2KNK86eSpxSyB3O3xTk+tAvoaHyJD9zIat6o6osLJ0Wu
         cyjEg1D9G7jD1rWqzD5Lo1LzPAMhSsbuIl+cxFzIW8TltJ3V+l+ZXfSa6ZVG7D+/b+m3
         x5BBS5IzFyQe68loiJ4c81+1xQx6V7jB2zwRjtx+Pb/ONvWskSMbwjM9f80SiHgMESlm
         vrQQ==
X-Gm-Message-State: AOJu0YzSZj+gy5FuFWQ/HQfgtzpb6vYk1SYtsyclWs4nTzznogW+lsZx
	gASOID5vZ4Nj8NztHijYnehYe138vJt0tY5yTBcngtsFz0koaIAxzZqgTL0/XdyodiOFP0YcYAR
	V66ITZy1KPP341COi4KJ7bZcb3TJvkdfi/WBBQcUPX620hkzFCOYQN3cpgbtYPPqZd+a3Dro=
X-Gm-Gg: ASbGnctK06hjYYijOjoqow02UXk4pWH6lOTw/naLFF7POQV7pvpGjwYw9OqkuqnU8yJ
	I8mkxemn1p7kH6yOhTD2+F9yxzNgp78V+LNpLWlx+lhWZLRTHEokCipk+MKda5mit2Rnan5O2ux
	akmSyW1IxX0K8keSXcp2GGVrdYyhU4unEd1Gq57XGqJ9UDd6xU+dlxnmZGFAFpETBAFUDPx3XQO
	iRH2N0ijDJ2GlF54TDmshF846YkX63TwlRMAiZqtofiYVQT3YMo5CvQTElAZORvVdM8xP+aPJF7
	2zLWX5aqi1pzXhvFeAvvzSeQosZsZcvWOkqAJ9/J9ikxhQKWf+zyrq2ZdTM=
X-Received: by 2002:a17:902:f60b:b0:234:8a4a:ad89 with SMTP id d9443c01a7336-23e1a42f6fbmr6328815ad.1.1752513907905;
        Mon, 14 Jul 2025 10:25:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbO7aRcMt+kW8VBDCqM672kHRgxeZaUhrqX9CI2h5te9SxNal5a1qxQM9jUWTx3dDMdQ9qNQ==
X-Received: by 2002:a17:902:f60b:b0:234:8a4a:ad89 with SMTP id d9443c01a7336-23e1a42f6fbmr6328165ad.1.1752513907248;
        Mon, 14 Jul 2025 10:25:07 -0700 (PDT)
Received: from [192.168.1.8] ([106.222.230.95])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4283b67sm96190775ad.3.2025.07.14.10.25.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 10:25:06 -0700 (PDT)
Message-ID: <d2e4501a-937f-413d-a58a-1a461c7947c2@oss.qualcomm.com>
Date: Mon, 14 Jul 2025 22:55:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: qcom: Update GPU firmwares of QCS615 chipset -v2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDEwOSBTYWx0ZWRfX/7j2jYs/WdoL
 ZQkNxj1k4dclznwznHDv512me/L4gwtw7Y5Fg29zEYfDEMKBSaj+UbaSAkKjfFDgtJD8S0Lb6xi
 vJeGd1P3QY0UIRKSVMYBQ5vxGlS6Cq+GKS27kFNqZeoaB5C6nD5Ax3HwR/Qw2w9E3oeLJcM6U5x
 CEk/I3LKibRDIJdVBk7XHjQakbtcEnsVkc7cTI/P9hGr1Qk9KbMOlpISmb9lEcJGYmCz5zyUSWg
 U9yN6RU+adZC1xGXRq1pn75IHfGvQrclHOCEy13V+QWvSJKlFzMhhdVIGKuBbSKp8taA8CwhN35
 t5+NQdksm6e4SznK/Z6h2+cqzlCPZdA6Ht+dd/qKB4QS48BdOdMZr0rnK7p0xeXH7jgxRpMZjD5
 g5+xim/Y+NPBpA1I2XAnljUQyCDh5b/NAAYMCAI8/WuzvUOy2qI60OV2cCN9WTlwGEzto0/D
X-Proofpoint-ORIG-GUID: ofEXLRDrbhl7dHjYSEaPoN96_oB3yGlF
X-Proofpoint-GUID: ofEXLRDrbhl7dHjYSEaPoN96_oB3yGlF
X-Authority-Analysis: v=2.4 cv=MpZS63ae c=1 sm=1 tr=0 ts=68753d7a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=J4hHMLXUlZdx2gNTs44xtA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=qC_FGOx9AAAA:8 a=19WyUhxMObQSCQBfIC8A:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 impostorscore=0 mlxscore=0 clxscore=1015 adultscore=0 bulkscore=0
 lowpriorityscore=0 mlxlogscore=495 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507140109

Hi,

Add/update the gpu firmwares required for Qualcomm's QCS615 chipset.

-Akhil

---
The following changes since commit 99d64b4f788c16e81b6550ef94f43c6b91cfad2d:

  Merge branch 'amd-ucode' into kfw (2025-07-08 12:00:49 -0400)

are available in the Git repository at:

  https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git gpu-fw-QCS615v3

for you to fetch changes up to 6907a7a381dd13d7fadc3a480ad470151c3f3782:

  qcom: Update gpu firmwares of QCS615 chipset (2025-07-14 22:47:07 +0530)

----------------------------------------------------------------
Akhil P Oommen (1):
      qcom: Update gpu firmwares of QCS615 chipset

 WHENCE                   |   3 +++
 qcom/a612_rgmu.bin       | Bin 0 -> 3072 bytes
 qcom/qcs615/a612_zap.mbn | Bin 14256 -> 14256 bytes
 3 files changed, 3 insertions(+)
 create mode 100644 qcom/a612_rgmu.bin

