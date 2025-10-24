Return-Path: <SRS0=FmjJ=5B=oss.qualcomm.com=kishore.batta@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97848CCD1A5
	for <linux-firmware@archiver.kernel.org>; Fri, 24 Oct 2025 09:37:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 65BEAC4CEFF; Fri, 24 Oct 2025 09:37:10 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 79ECEC4CEF7
	for <linux-firmware@kernel.org>; Fri, 24 Oct 2025 09:37:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 79ECEC4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59O3FLTr014876
	for <linux-firmware@kernel.org>; Fri, 24 Oct 2025 09:37:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=C+fusbkoadjMWXvXggnOBP
	BeMDOfOhNiP3AjsjCKhaI=; b=e/kEczmQ0pHirnYEoJEqPi3yryYRgw5u3gCqf/
	QghfApoLcPfOEl5iWVYUb84wNAu4LFarb4NX3wpJAYJWojdCCCri3j7waRRBZLrY
	X8YDnPzZRujMPxKd+7HU7DBXlXIPyN4Z3SH/EkGxEz6yFGA/cbRW7bCbaW1Jiky/
	JFKGse3g5MwYgqXg0br5pC1Zib8lOIA+L2PApd0g06e9Mc0TSVEwuqiltPfX49sg
	AvJ+zAh5NKDMYMUY/ntxi+MPSHAT6FDPKmOzJZI+EVgApD4uwtpYyRMdJ0+KZrAp
	HjJvZzFrsLvLQDK60+9wy8Ve+3JajZq6UVatDEzAtawU9yDQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v08pustu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 24 Oct 2025 09:37:08 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-33bcb7796d4so1894654a91.0
        for <linux-firmware@kernel.org>; Fri, 24 Oct 2025 02:37:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761298627; x=1761903427;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C+fusbkoadjMWXvXggnOBPBeMDOfOhNiP3AjsjCKhaI=;
        b=X13G4B+P9MJSgrzgtvpdoEuUjRppcAQQfgbSVCPNAyGZvmZAS5NZaNwtjvpMO7kH+E
         NNndM7e2IgcKz/dvBVI/tktJ0XyN2sSovZYbFmypP591HkVvLhWPVLslvYmCsAbBeyv6
         cu8bx5RK46hJQnTDuq5F15XzGlaRsaL0oEe43QE6ffwEhA+6AYO/ogJ206841ix2Jnct
         0OkBXZZa9/wNSsocrFCsLJk+ygbqMizOSBsrDZiJnbOTjlDhToYjARrTYPIxlJf7Rd6s
         EmJlaMNXPEV5GIiz9Dsjkx235mSWBEupaGtJpXLcJ4mQntg/ytDn4MuGxXIx3NEJSB07
         QQkA==
X-Gm-Message-State: AOJu0YyuTUrMUKh2ZS9v947g4NyjokCccuCylHjacEb4s9E/ctRS/Jg/
	4mHkrBoaQjfHK7htUAjxMJBlPGY/Cp0J/LhwiEEfmqYcYOsuxACxHZJuBlnhMHQHZY6Z2SK46M0
	ZJdq8rTCmGkVilV0cWFMJfW4aLTfMgo96A52a/gIaXnCrSVAi1AVnTH9ZqPhaXibSXn0hnt8=
X-Gm-Gg: ASbGnctDxXwbccV5TXolZKY7SiPwt3TUUyWxFw+tZJ6u5RD1SWLbARw3DsSWJAifGCr
	aoD9b2EG8JYVo/eGBfuUDi1ig9x1W6deHF+kNbmh+j539aEoRwyMG7eTW9TA3Y+GiiDL9NicSl8
	DhqbdY7miXMcnLuOuyndDoOaH98f/gGLOeDzK9IHkrnr7niYfM3bOVVrvDcNB/nhNT5B9lzzR0N
	xp12ru0mzWuhF9NVAnoPvXTEYiW4PqR00xBe+SgCNh4571w5x+AgrhXCpZ90ycRg9OXkzeGlHpU
	g9dOidOIvrJgS82YoMxdqD/ywrRfHNtaEfQMj28R5ma1nnoOWmLf/oErV4ijdoc8AF6+0oFuSRZ
	aqECavcctG3rJ70Fuhy3EGsxepGTmepM=
X-Received: by 2002:a05:6a20:72a6:b0:2f8:4558:ad9e with SMTP id adf61e73a8af0-33c619cfe2emr7765474637.33.1761298626867;
        Fri, 24 Oct 2025 02:37:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDHBVjFGzKuUpbGUIqSXRWcHexejO1aUPEE4P6CTG+7DRGkCqBJro31KrnDh4cMrmNnKnI2Q==
X-Received: by 2002:a05:6a20:72a6:b0:2f8:4558:ad9e with SMTP id adf61e73a8af0-33c619cfe2emr7765448637.33.1761298626307;
        Fri, 24 Oct 2025 02:37:06 -0700 (PDT)
Received: from [10.217.219.169] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6cf4e3c6dcsm4547232a12.36.2025.10.24.02.37.05
        for <linux-firmware@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 02:37:06 -0700 (PDT)
Message-ID: <9d96eedd-c1de-488e-ac5a-d515d8d3563b@oss.qualcomm.com>
Date: Fri, 24 Oct 2025 15:07:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Subject: [PULL]: Revert QDU100 firmware binaries due to licensing concerns
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAwMCBTYWx0ZWRfXyjVUUuCv7lBv
 ypssVFCK3NLJUQTfTXPW3eBk0YDy2fWIertJtfJWgDUz+If+6LfFMxCKPSs44Jt6BsV+OYIArXG
 BSeIS+ZzuzeXElDBgterFcX3tPgiBp+yu7BTdaCRGRy/67FZaJeNY1pL7/HMM7dKjhqjInbEcte
 /FWMx/AYoUORODcs6V2mGIAyxWeUNkArcD7BKyyaeThiU6VdfszpXthmCghFRBPU8Wm/exO2Ksj
 Lx7BuEH8B2aADUtBPyP9T8lIf+dX7XTKbvQ4uCZNJR3qlKYmVU708Ci4NW8kqz0ZhG+ExSNrnkk
 ft6AiFj99cysogPaxwtY2/kaM9pArDlE/JY6XLo8wicKAW868Qb+Dt5G91oRp3nmEcN8kkdfzsl
 JEYBnsSBEjAfw8A8xrh1EfUEiDgSLg==
X-Proofpoint-GUID: eluUF9zd5VQmgO0K9ZTv0IFmhIg7Foe0
X-Authority-Analysis: v=2.4 cv=Up1u9uwB c=1 sm=1 tr=0 ts=68fb48c4 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=RYxTWaDTJBRX3_IvHLoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: eluUF9zd5VQmgO0K9ZTv0IFmhIg7Foe0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-24_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180000

The following changes since commit 19731a36222e7b1ca09be090a19bfd89640a837f:

   Merge branch 'HP_Linux_Firmware_20251023' into 'main' (2025-10-23 
13:30:10 +0000)

are available in the Git repository at:

   https://github.com/kishorebatta-ossqcom/del_linux_firmware.git 
del_firmware

for you to fetch changes up to 5f77f6bd970a5ffecf049ea4231363b5144e1dd8:

   qcom: Revert QDU100 firmware binaries due to licensing concerns 
(2025-10-24 14:51:32 +0530)

----------------------------------------------------------------
Kishore Batta (1):
       qcom: Revert QDU100 firmware binaries due to licensing concerns

  WHENCE                          |  22 ----------------------
  qcom/qdu100/abl_userdebug.elf   | Bin 212792 -> 0 bytes
  qcom/qdu100/aop.mbn             | Bin 510944 -> 0 bytes
  qcom/qdu100/aop_devcfg.mbn      | Bin 12136 -> 0 bytes
  qcom/qdu100/cpucp.elf           | Bin 68576 -> 0 bytes
  qcom/qdu100/efs1.bin            | Bin 512 -> 0 bytes
  qcom/qdu100/efs2.bin            | Bin 512 -> 0 bytes
  qcom/qdu100/efs3.bin            | Bin 512 -> 0 bytes
  qcom/qdu100/fw_csm_gsi_3.0.elf  | Bin 20328 -> 0 bytes
  qcom/qdu100/hypvm.mbn           | Bin 1358672 -> 0 bytes
  qcom/qdu100/kernel_boot.elf     | Bin 49004344 -> 0 bytes
  qcom/qdu100/mdmddr.mbn          | Bin 81960 -> 0 bytes
  qcom/qdu100/multi_image.mbn     | Bin 12088 -> 0 bytes
  qcom/qdu100/multi_image_qti.mbn | Bin 12088 -> 0 bytes
  qcom/qdu100/qdsp6sw.mbn.xz      | Bin 5589248 -> 0 bytes
  qcom/qdu100/qdsp6sw_dtbs.elf    | Bin 7992 -> 0 bytes
  qcom/qdu100/qupv3fw.elf         | Bin 56432 -> 0 bytes
  qcom/qdu100/shrm.elf            | Bin 82428 -> 0 bytes
  qcom/qdu100/tz.mbn              | Bin 3186640 -> 0 bytes
  qcom/qdu100/uefi.elf            | Bin 2666296 -> 0 bytes
  qcom/qdu100/xbl_config.elf      | Bin 225368 -> 0 bytes
  qcom/qdu100/xbl_ramdump.elf     | Bin 749464 -> 0 bytes
  qcom/qdu100/zeros_1sector.bin   | Bin 512 -> 0 bytes
  23 files changed, 22 deletions(-)
  delete mode 100644 qcom/qdu100/abl_userdebug.elf
  delete mode 100644 qcom/qdu100/aop.mbn
  delete mode 100644 qcom/qdu100/aop_devcfg.mbn
  delete mode 100644 qcom/qdu100/cpucp.elf
  delete mode 100644 qcom/qdu100/efs1.bin
  delete mode 100644 qcom/qdu100/efs2.bin
  delete mode 100644 qcom/qdu100/efs3.bin
  delete mode 100644 qcom/qdu100/fw_csm_gsi_3.0.elf
  delete mode 100644 qcom/qdu100/hypvm.mbn
  delete mode 100644 qcom/qdu100/kernel_boot.elf
  delete mode 100644 qcom/qdu100/mdmddr.mbn
  delete mode 100644 qcom/qdu100/multi_image.mbn
  delete mode 100644 qcom/qdu100/multi_image_qti.mbn
  delete mode 100644 qcom/qdu100/qdsp6sw.mbn.xz
  delete mode 100644 qcom/qdu100/qdsp6sw_dtbs.elf
  delete mode 100644 qcom/qdu100/qupv3fw.elf
  delete mode 100644 qcom/qdu100/shrm.elf
  delete mode 100644 qcom/qdu100/tz.mbn
  delete mode 100644 qcom/qdu100/uefi.elf
  delete mode 100644 qcom/qdu100/xbl_config.elf
  delete mode 100644 qcom/qdu100/xbl_ramdump.elf
  delete mode 100644 qcom/qdu100/zeros_1sector.bin

