Return-Path: <SRS0=7Cob=6Y=oss.qualcomm.com=kishore.batta@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9F3CD6D22E
	for <linux-firmware@archiver.kernel.org>; Thu, 18 Dec 2025 15:18:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C1BE8C116C6; Thu, 18 Dec 2025 15:18:24 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 870CBC4CEFB
	for <linux-firmware@kernel.org>; Thu, 18 Dec 2025 15:18:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 870CBC4CEFB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI8mbs0813871
	for <linux-firmware@kernel.org>; Thu, 18 Dec 2025 15:18:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=iamBIeqARGmYzF2oQhVZj+
	oXZNxFbEk20gmqlpXo41M=; b=Ntx5B4pj5cg7AFKaUXrK4j3djJx4nV+c+PQpWh
	c4wOsJ+mfujvtYPu/Xg24Ia7Mk0aHHd5xl3r4rsrvl84aN9sbWnxf34B16BbF8SP
	DtrknRbbg6iacRV5yvuZBqcuKfeuPwtO2jeKEAR7QQJo3taTaR7FgUrCWuDj3b0c
	GR/8Om7jmsuk7o9ggW5fQvc3gyjI0KaS97/SeL8KH2DsQTwhWZ+BfAkfiaitQb4h
	HUjpgFCVRPGeszLMOZfboAOPuy+rNoy/o5UXv6BoomEHl7eCcn+enizigNaQsQCu
	QGfoyTnA7h5xj4P21yo1c/4rP3t2DuYh6/HP46OHO+ju1diA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b40v7bh2g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 18 Dec 2025 15:18:22 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7b9208e1976so1320334b3a.1
        for <linux-firmware@kernel.org>; Thu, 18 Dec 2025 07:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766071101; x=1766675901; darn=kernel.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iamBIeqARGmYzF2oQhVZj+oXZNxFbEk20gmqlpXo41M=;
        b=PRpAtqZVyHoWczQjotBAK8ZLnnTiJ1Jsb7ouplsEe0BX/Xi0ieB/fs39fiO9EXn6TE
         i9yobKCf9o4II7IAaIWcmPPcWvYZsNvjb6d73M5x0fdkw6m7ah989oX4chy4Hj5rp8bW
         FG/L8VQyZ0azvnvRWo7BSRu5UMIxuwE48ZL5y/TwrbO96urZ26YtrnhkALOfJj72N8mm
         U4uvI0c1gPJC7SPC1AJRSmudG00+fHDIrce41BAzYxnsZI2+LbXSaAYJ+8MofWAz98jW
         RVDKL6uUzU7mP2D4F9H7hm/NTCXoN+EHcQaPmf3aSAKY9YVeZu0SSrftMCLEvrBCJM+A
         fICA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766071101; x=1766675901;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iamBIeqARGmYzF2oQhVZj+oXZNxFbEk20gmqlpXo41M=;
        b=EQhkfZq9FMyPIpedAiay239LasydRBBNszbvqsRE10NkM/FZcvMhBeGOs+eL899r32
         bS9SlzU13IpvCdmS9pLoC5PKnJ1p65HJMZOeFVQTrWQEVyT/1XR5BXjl9In2jWVgjxaf
         M4OtTw03UNm/gly3hs7rwC/oVZh1m1yS7UuU/r9y5AN7bUDGILjY/ov3iAPnJX+rz808
         +WmiyLTOajCdztuYVk3mkz9gNNBZhQQIqZgnPNmmmRF/J/YDabAcaiXlUQrHkRJqRkl/
         cR9YZHVemH8Xgq733RG8t/WakdkzFb7w1MevZ6vPNCCWryAmQRVgr36R+zk4dL+VdfYJ
         XISw==
X-Gm-Message-State: AOJu0YywdkLyQuV/ZVanoOtb3rhN8Zlrb3gkT9wWjZSQNT+VKtFbDpHa
	d4abNkM7dzTts1prXGmizMTq7mGlgzevWvPaAMd32UDs6jk6jqGxK2wKrYusbbnoP3wqdnyn9tT
	U4qJuOgtQFYeADZ0VWocf/cFWRNKxvIwjsxLJ+eQRe22DHiwmloIFpXcDQBE5DnlkEF5hAXU=
X-Gm-Gg: AY/fxX6y+5uVdFyq/Ii56lEqxa7yztxHsY3PLUU0jUYooK38Xfev+jTJrOZRNT5AjAu
	8ZiblSfTOV/FnRPYeWS24SX/zwtdIB+9KTGY4J5uztGYfo1OKKaHG9d0ENR5W+RGZyowQ8Uqgyp
	/jdf3meJfAATrQJDH0CGUteHnDpeXCMcq3mGF0OzIOBuL7gvySKNA49BlIiDa/LviM7L7yXy9nW
	/1so+4krzxKYVVNGu+qs7Lftl/fx/TETPt9OK0Fu3JLcSH99nw72dgdwNoL8j0/44nRkFnC2+ep
	7HbSuH0o1ATL8JwM2ZufrhaQ2mv0dLu91NgupKvXk9rD7qkQdLlAGuBjSJNcJ5kTvlnCuNnDsDi
	8HhktvJYmYy9SXWsqjGMcXRbpLgk/N40kBsYU6vWjhP0=
X-Received: by 2002:a05:6a00:1ca3:b0:7e8:4398:b35b with SMTP id d2e1a72fcca58-7f66969e4edmr18368938b3a.46.1766071100688;
        Thu, 18 Dec 2025 07:18:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHh/oUMkdfp/i/Ba0w+peSoOLC84+zpzUuI8A89lkgs5w2/cMjTKb4yoJptSWCne44lriQ5pg==
X-Received: by 2002:a05:6a00:1ca3:b0:7e8:4398:b35b with SMTP id d2e1a72fcca58-7f66969e4edmr18368899b3a.46.1766071100004;
        Thu, 18 Dec 2025 07:18:20 -0800 (PST)
Received: from [192.168.0.215] ([49.205.244.213])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7fe14179c90sm2961388b3a.49.2025.12.18.07.18.18
        for <linux-firmware@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Dec 2025 07:18:19 -0800 (PST)
Message-ID: <deea8617-b699-4f48-80aa-69f78ccfe852@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 20:48:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Subject: [PULL]: Revert QDU100 firmware binaries
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: NmVLl5U_2iD00NjIXeQwPByUkQdoQRfn
X-Proofpoint-GUID: NmVLl5U_2iD00NjIXeQwPByUkQdoQRfn
X-Authority-Analysis: v=2.4 cv=f8JFxeyM c=1 sm=1 tr=0 ts=69441b3e cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=KtsNJ/6bKgz7QsArn2OSsQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=XGYx4LKhIy6jSofDQS0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDEyNyBTYWx0ZWRfX3gE3oSQny3iH
 BvlkB/hm6B78vMFYEstUQ1S0I23UDtMF+qfRn2UcG6eTBV+zQmEYgw2oxWYYXvVCB2/+2ATTbV4
 hxhDFgU5SYG+42G80I7Z+YH4AyDPW2+UKw5l9gX1TS/UvS98ncXwcwbZCZP/LhHRSSqQV+HHNd1
 6ML1KL4qA4vHSz9EB1SIK6klfBBuMxeZJL8T+90IMreNsFDi4qpY/WJsQzIuRcIDZ/Fo6Kmxp0y
 /NDj/moSt+MAolSSsFZ8fucoEMofjm0UM/PhjkgAz0XVs4pke1Gfmzfie1lHVKc5A9acqdLzYeV
 Iq0xskiFG+17arZwnDv9vUSIW8l9YcsgSDzdqk6DC1sVc/o5nW/W5gj4RvKymvWfOAYLyh+lZGK
 0nEkLJszCY/swZxJn1kEVE1iqOvacw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180127

The following changes since commit e66d9269e773a553a99f7771982a4bef06c562ec:

   Merge branch 'robot/pr-0-1766039412' into 'main' (2025-12-18 13:28:40 
+0000)

are available in the Git repository at:

   https://github.com/kishorebatta-ossqcom/remove_qdu_firmware.git

for you to fetch changes up to 1b13c94137c81ae21d81065ac94c27e71c51bc96:

   [PULL] : Revert QDU100 firmware binaries. (2025-12-18 20:36:55 +0530)

----------------------------------------------------------------
Kishore Batta (1):
       [PULL] : Revert QDU100 firmware binaries.

  WHENCE                          |     22 -
  qcom/NOTICE.txt                 | 268885 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
  qcom/qdu100/abl_userdebug.elf   |    Bin 212792 -> 0 bytes
  qcom/qdu100/aop.mbn             |    Bin 510944 -> 0 bytes
  qcom/qdu100/aop_devcfg.mbn      |    Bin 12136 -> 0 bytes
  qcom/qdu100/cpucp.elf           |    Bin 68576 -> 0 bytes
  qcom/qdu100/efs1.bin            |    Bin 512 -> 0 bytes
  qcom/qdu100/efs2.bin            |    Bin 512 -> 0 bytes
  qcom/qdu100/efs3.bin            |    Bin 512 -> 0 bytes
  qcom/qdu100/fw_csm_gsi_3.0.elf  |    Bin 20328 -> 0 bytes
  qcom/qdu100/hypvm.mbn           |    Bin 1358672 -> 0 bytes
  qcom/qdu100/kernel_boot.elf     |    Bin 49004344 -> 0 bytes
  qcom/qdu100/mdmddr.mbn          |    Bin 81960 -> 0 bytes
  qcom/qdu100/multi_image.mbn     |    Bin 12088 -> 0 bytes
  qcom/qdu100/multi_image_qti.mbn |    Bin 12088 -> 0 bytes
  qcom/qdu100/qdsp6sw.mbn.xz      |    Bin 5589248 -> 0 bytes
  qcom/qdu100/qdsp6sw_dtbs.elf    |    Bin 7992 -> 0 bytes
  qcom/qdu100/qupv3fw.elf         |    Bin 56432 -> 0 bytes
  qcom/qdu100/shrm.elf            |    Bin 82428 -> 0 bytes
  qcom/qdu100/tz.mbn              |    Bin 3186640 -> 0 bytes
  qcom/qdu100/uefi.elf            |    Bin 2666296 -> 0 bytes
  qcom/qdu100/xbl_config.elf      |    Bin 225368 -> 0 bytes
  qcom/qdu100/xbl_ramdump.elf     |    Bin 749464 -> 0 bytes
  qcom/qdu100/zeros_1sector.bin   |    Bin 512 -> 0 bytes
  24 files changed, 268426 insertions(+), 481 deletions(-)
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

