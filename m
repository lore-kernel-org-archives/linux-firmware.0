Return-Path: <SRS0=FmjJ=5B=oss.qualcomm.com=kishore.batta@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE8FACCD1A5
	for <linux-firmware@archiver.kernel.org>; Fri, 24 Oct 2025 09:49:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 92E33C4CEF1; Fri, 24 Oct 2025 09:49:56 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 50D4AC4CEF5
	for <linux-firmware@kernel.org>; Fri, 24 Oct 2025 09:49:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 50D4AC4CEF5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59O3FLFI020350
	for <linux-firmware@kernel.org>; Fri, 24 Oct 2025 09:49:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SCMQPHQTUcAYQlcYTcbwamuiw6saGNH3RzAx6C8KA4s=; b=cYqTKWPM5hL7XWF8
	HS74bA1wa83Ww9nHqJhEr/onFA4ChHUhMOSl+k1mEJGQwVErttxF5aPuBbJ7y/87
	8wRANPuI8/kORej6LScCzFSL1PQ5kvsve9Y0yKQdDcI0DsD8dyGYRjvQXDuhbiuG
	wsgv1nUo24JBmtCm3+iPsVKDv/3r9nUmv6guf0LNkQS8GC+Bou5PJoLfbZhmXM10
	t5r3UXeFHZfw2EfFaB832jhILA7G0ELBMpgsvpGf1DwJA9ziZDdo5SsyCdpYbmjY
	RGhZmAqsUxV1muKyy+tGzMw1CjO3njTvSO4AkwO8Hnwk8v/l9QFTkJdJtItL0Kxc
	VT5BsA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xhe0sk7w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 24 Oct 2025 09:49:53 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b609c0f6522so3789109a12.3
        for <linux-firmware@kernel.org>; Fri, 24 Oct 2025 02:49:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761299392; x=1761904192;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SCMQPHQTUcAYQlcYTcbwamuiw6saGNH3RzAx6C8KA4s=;
        b=VeRRY6dY2ckBgMs+YaKzmWI8bAo6djtsuKiPAvbXQYCFH1us9BOwlVI+hiC/uPwI+V
         JaEvWLbc1e6cUbzhIDntRt096pg89OE6UNJOrHcSHS8UmpZRyGAeyx6wJaFNR51ddTwa
         EOClHUyMShGixlanBm2lZPI+dF1/eoTQmfYNHwnBACxl2qTPG4mP2NnFJRoJmHBjkKU0
         IShySe9WKGHACuHC1ogk2cZETZjwFjWmd1ipu2rOb68XkAnvHsj/JswTuAq1lM+xW5NK
         C+hwj0hFSxnz3MVvDPhRgTdwZ4tT2tsX3Tso9dPFFYnjhy4cqdJLTwDDDtKIwm5NME2f
         ogzA==
X-Gm-Message-State: AOJu0YxUAGVs2+HgR8uZ0KW1nHxmWUiA7PkmXayVGhfl+f1BxnPcNsKC
	OU+1hM+izgWcLr9+ESQ1dlvFCm9gI6HT4tsoAaGb/bzKi2cDkF8e57bzVtk3fSjGXY5MxmFAxu1
	1X65JggGg7NDj04XoM5hOeQC2gddjbUkVzsjEV+DNxyJ2s5C5VlfulDX35FwDrSI1YRSc5zQ=
X-Gm-Gg: ASbGncv9QxKy0Yh4olcbW37J449aWiwtXbYQQIQ88+GtSBfLymLlCovTGMG9BMJGEkF
	DMTKtA7xiNnNssq61zZKRMZsqjX9aU6qjWIZupV9UlqknGRyVc3AEypUMrcHY/AZT4TotVzbpcg
	y1e5lzr9kuKtTodDqFDhDfp3lEPGcbrP/JzgXS9Ubmc02PHS+Oj3n/pmtFm7hX/x/uqUNhjlPv4
	f+UmlZuE2vOc/eL7yUO7kyDj2KSwDKi4epStKvgOdXaw/StlVn0dEkGDCJhapOWEPKzRMbQOQAo
	VQcPMbq9TyN3zQv1F4AdQfhB+2GjgEgustXYciq9scJnLlgchz0gkcVz8DdHjyg9pDKohKX7WqV
	u4yZ1q2D90LXioHJvL6N3Df4+uU/VbX8=
X-Received: by 2002:a05:6a20:a122:b0:2b7:949d:63da with SMTP id adf61e73a8af0-334a8564eccmr35371154637.18.1761299392413;
        Fri, 24 Oct 2025 02:49:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWjGN0b23UYllL0Z5PWhwxRrsjL/WqqrRbWVOe0FQtNSpEcqWrJfRmQDdchZUX5qAUJRKojw==
X-Received: by 2002:a05:6a20:a122:b0:2b7:949d:63da with SMTP id adf61e73a8af0-334a8564eccmr35371132637.18.1761299391877;
        Fri, 24 Oct 2025 02:49:51 -0700 (PDT)
Received: from [10.217.219.169] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6cf4c056fbsm4458617a12.17.2025.10.24.02.49.50
        for <linux-firmware@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 02:49:51 -0700 (PDT)
Message-ID: <76de8198-d219-443c-9283-2811ab338c17@oss.qualcomm.com>
Date: Fri, 24 Oct 2025 15:19:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL]: Revert QDU100 firmware binaries
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
References: <9d96eedd-c1de-488e-ac5a-d515d8d3563b@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <9d96eedd-c1de-488e-ac5a-d515d8d3563b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE2NyBTYWx0ZWRfXyRTCrZSpk8P0
 mjwtVJx+jJVMui3d/Tw4qDjBVQ/Yem0Saa7hDX49pMAEIiWCzIpNpRzecMAGydjIAoGTRhDHOLm
 FgPgaO3QeZ1+RyPp0Up7Pxq77+YSvFKDnI58I68RXxPD5xj+SkOvcgWbZH5BWPLaYJWA/taYPPz
 WpXBKw+1nHi3lduk94Npqc3o+V0cNVlbIO6NSHNNFoSSbjQGwto7LCjnjpFweTjahXCOs4P6P50
 0/x+7i3wizHEYCYDSpNkhJCI1euPjuHLy9ICygh5qJAydtVn03RFp4QVIuHXN8/8ceeg7W/7T4C
 9hSJ4haBb8khj/OZ5wZuaj3bliW5EXaz2TMJBt4cZMmWudjdusDYT3qP1HHtSU9d2F3MUEyO8+B
 HrDrBfCKCq7C3+4BbntfZIWi4NTG5w==
X-Proofpoint-ORIG-GUID: LqqdNNoL_i6X9mahA7zrOM9SbVh0c0wY
X-Authority-Analysis: v=2.4 cv=WYUBqkhX c=1 sm=1 tr=0 ts=68fb4bc2 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=3lJfUiCjGT6dCFu2qigA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-GUID: LqqdNNoL_i6X9mahA7zrOM9SbVh0c0wY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-24_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510210167

Hi,

This is an updated pull request to reflect a corrected commit message.

The following changes since commit 19731a36222e7b1ca09be090a19bfd89640a837f:

   Merge branch 'HP_Linux_Firmware_20251023' into 'main' (2025-10-23 
13:30:10 +0000)

are available in the Git repository at:

   https://github.com/kishorebatta-ossqcom/del_linux_firmware.git 
del_firmware

for you to fetch changes up to 6cbada6d08a6ffda349ed68e4190563347512483:

   qcom: Revert QDU100 firmware binaries (2025-10-24 15:17:21 +0530)

----------------------------------------------------------------
Kishore Batta (1):
       qcom: Revert QDU100 firmware binaries

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

-----------------------------------------------------------------

On 10/24/2025 3:07 PM, Kishore Batta wrote:
> The following changes since commit 
> 19731a36222e7b1ca09be090a19bfd89640a837f:
>
>   Merge branch 'HP_Linux_Firmware_20251023' into 'main' (2025-10-23 
> 13:30:10 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/kishorebatta-ossqcom/del_linux_firmware.git 
> del_firmware
>
> for you to fetch changes up to 5f77f6bd970a5ffecf049ea4231363b5144e1dd8:
>
>   qcom: Revert QDU100 firmware binaries due to licensing concerns 
> (2025-10-24 14:51:32 +0530)
>
> ----------------------------------------------------------------
> Kishore Batta (1):
>       qcom: Revert QDU100 firmware binaries due to licensing concerns
>
>  WHENCE                          |  22 ----------------------
>  qcom/qdu100/abl_userdebug.elf   | Bin 212792 -> 0 bytes
>  qcom/qdu100/aop.mbn             | Bin 510944 -> 0 bytes
>  qcom/qdu100/aop_devcfg.mbn      | Bin 12136 -> 0 bytes
>  qcom/qdu100/cpucp.elf           | Bin 68576 -> 0 bytes
>  qcom/qdu100/efs1.bin            | Bin 512 -> 0 bytes
>  qcom/qdu100/efs2.bin            | Bin 512 -> 0 bytes
>  qcom/qdu100/efs3.bin            | Bin 512 -> 0 bytes
>  qcom/qdu100/fw_csm_gsi_3.0.elf  | Bin 20328 -> 0 bytes
>  qcom/qdu100/hypvm.mbn           | Bin 1358672 -> 0 bytes
>  qcom/qdu100/kernel_boot.elf     | Bin 49004344 -> 0 bytes
>  qcom/qdu100/mdmddr.mbn          | Bin 81960 -> 0 bytes
>  qcom/qdu100/multi_image.mbn     | Bin 12088 -> 0 bytes
>  qcom/qdu100/multi_image_qti.mbn | Bin 12088 -> 0 bytes
>  qcom/qdu100/qdsp6sw.mbn.xz      | Bin 5589248 -> 0 bytes
>  qcom/qdu100/qdsp6sw_dtbs.elf    | Bin 7992 -> 0 bytes
>  qcom/qdu100/qupv3fw.elf         | Bin 56432 -> 0 bytes
>  qcom/qdu100/shrm.elf            | Bin 82428 -> 0 bytes
>  qcom/qdu100/tz.mbn              | Bin 3186640 -> 0 bytes
>  qcom/qdu100/uefi.elf            | Bin 2666296 -> 0 bytes
>  qcom/qdu100/xbl_config.elf      | Bin 225368 -> 0 bytes
>  qcom/qdu100/xbl_ramdump.elf     | Bin 749464 -> 0 bytes
>  qcom/qdu100/zeros_1sector.bin   | Bin 512 -> 0 bytes
>  23 files changed, 22 deletions(-)
>  delete mode 100644 qcom/qdu100/abl_userdebug.elf
>  delete mode 100644 qcom/qdu100/aop.mbn
>  delete mode 100644 qcom/qdu100/aop_devcfg.mbn
>  delete mode 100644 qcom/qdu100/cpucp.elf
>  delete mode 100644 qcom/qdu100/efs1.bin
>  delete mode 100644 qcom/qdu100/efs2.bin
>  delete mode 100644 qcom/qdu100/efs3.bin
>  delete mode 100644 qcom/qdu100/fw_csm_gsi_3.0.elf
>  delete mode 100644 qcom/qdu100/hypvm.mbn
>  delete mode 100644 qcom/qdu100/kernel_boot.elf
>  delete mode 100644 qcom/qdu100/mdmddr.mbn
>  delete mode 100644 qcom/qdu100/multi_image.mbn
>  delete mode 100644 qcom/qdu100/multi_image_qti.mbn
>  delete mode 100644 qcom/qdu100/qdsp6sw.mbn.xz
>  delete mode 100644 qcom/qdu100/qdsp6sw_dtbs.elf
>  delete mode 100644 qcom/qdu100/qupv3fw.elf
>  delete mode 100644 qcom/qdu100/shrm.elf
>  delete mode 100644 qcom/qdu100/tz.mbn
>  delete mode 100644 qcom/qdu100/uefi.elf
>  delete mode 100644 qcom/qdu100/xbl_config.elf
>  delete mode 100644 qcom/qdu100/xbl_ramdump.elf
>  delete mode 100644 qcom/qdu100/zeros_1sector.bin
>
