Return-Path: <SRS0=tlAH=BK=oss.qualcomm.com=viken.dadhaniya@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFAD9EB1054
	for <linux-firmware@archiver.kernel.org>; Tue, 10 Mar 2026 14:38:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C6F43C2BC86; Tue, 10 Mar 2026 14:38:59 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F33C4C19425
	for <linux-firmware@kernel.org>; Tue, 10 Mar 2026 14:38:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F33C4C19425
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACaTsl303796
	for <linux-firmware@kernel.org>; Tue, 10 Mar 2026 14:38:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=eka3ngLL9vO+TBrHGGdRk9
	kpucn43O7ogiVWIhGFPdM=; b=X+L1oWm0NiSwUdVVhkHwyeejpS24TV5IgqKnfc
	xUc5OAF7JTCZy0z8E6rqaiQeWGCf6DtvBlwl9STYWXoskZvsOVLLE6R9VuiLySgA
	76dc2KDtv5fsQfyU7xafE0ATqpdGdoRmvEIDxXctfl92mQSnyxbsXwy6U1/Qi6N1
	ulqbuR+aD+DiAmoxtCHH4R40kHU6U/LU81g6HO3ppimYKrQq1rc+O15IHgBNJxPX
	B95GOcC4d4Y64tZp1Hgu8AqShUOA13YnijGpP13W0C6zZ9IUC1cYoGmdJfE+Jrc5
	FfOQL6d+m2lherxIE2QT6465ZGUqB+aaRNUZUHIdJ/qNflVA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cthjf0xfe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 10 Mar 2026 14:38:58 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35449510446so12332052a91.0
        for <linux-firmware@kernel.org>; Tue, 10 Mar 2026 07:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773153537; x=1773758337; darn=kernel.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eka3ngLL9vO+TBrHGGdRk9kpucn43O7ogiVWIhGFPdM=;
        b=ejUKYa6+iuIhm8eup//bO4YfthvmU1/rFVCtg1XtVGNwwjHdXtlFph7CYmEO5KzxbK
         fdfqDGuHAUwxwz4RQBLdca9dbTjuITLwqQruUqVCrS3CuxV7k9GbiKHDZ//3cEVTOsuK
         e2JH7eWw1t7uoqBpuwPKg6IKq/otXHgVmq//ma2fTfud4aYznP+FBYJzhrYZFkCirjH/
         xASLouHyy5NCb3UGDCMyT6EOFICgaI6v3ldsDMC9k+525RhrqCdx7GbnM0BxtOObqAV9
         OajDmeZxJIcfwsExop79nsX6JyZMgAuPuAd6b7oR8vOOBilyu2qQlofWuyGEfPbzLHR2
         5JeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773153537; x=1773758337;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eka3ngLL9vO+TBrHGGdRk9kpucn43O7ogiVWIhGFPdM=;
        b=PvXwk+Pd2AofR6sk2BXyHNj4KO4tVBpzu8jKB9bmNGUe1ltnQ0lrxjmHmS+ED8cYGf
         4Q0BzKnLoh3V/tUR1FDsSVDFtoVMkItCn/mz7NCbe69hJqAdQo4oHAy9Zb3daBv4KfMs
         W7xgOtvbPg3HJH3mabP4/W/1/xqEHFbmKGNJ8RefadmRdmPLLhDcc9bZfXrq4tsJMAVb
         y7Qip2n3OagJKHNRSkIHx8OdAuHyst1Th80W89Yc44/BNyxeTjR++dW2U/HGEZmheugq
         cPtOan0t7rYnNhYCabEEtOXO0ihRprBkt+lY6A0APT/Nmlo5hHyBKBwYgVo+G6TAhvFl
         a7/Q==
X-Gm-Message-State: AOJu0Yx4WdXkUAYHMxBJdRA18EyuaG7R5QH2Biil8+o/Y6HsA23+0iA1
	32e1RpUWAVXwTnp0Ob5UVltK4yulyP/bsYKqA0MzIj/BJEqHIHKOoq0KrQxICjV3VBXUHz9NE6p
	JOdyw8PR5pZQuO20IZktEqAF0mlpetvsDL4JqfsWki92Ss3pbIhPECHgTx8GgGzJdtK38kog=
X-Gm-Gg: ATEYQzyLHxMTwkCJLLqVJpmdhietuXLd0wcCxn7vh7RI3MV/PRiMe1uZs2wlx5jBURJ
	vI/wpmln6PPZTmo1PMitdqQNg+rokjaLn6yoYHfl77Ipe68JkhPMfGYB7lHCcDSp8S9w1NrpTvE
	hHpVSewsNZjVg2+QJcaPUHGu2ORTNlsmhCz/VoYBEvljS8GFJ1WUcb61sbgySWGulHswsuiq+fl
	uKDfQYzWpumJ4TGOOZsIPjmAbnL/XtjOwAHbLiDMDN21VGzWBPmAArtHF0B5ymGPQL5pd1G77xD
	GvJX6euWKjHaNcf3s1FfeznxPYEziGojZEkkC8j4DRCFbd2tNCYrY2gibcNlVs/KMLlatar6Boa
	WFgnWpcz0PUD+eNz7/piuNA6Sc7bBlt6TKRfvM1LHJP0XLVLVftifGKWT
X-Received: by 2002:a17:90b:2685:b0:359:84e1:ba2e with SMTP id 98e67ed59e1d1-359be2eeddcmr14262361a91.18.1773153537168;
        Tue, 10 Mar 2026 07:38:57 -0700 (PDT)
X-Received: by 2002:a17:90b:2685:b0:359:84e1:ba2e with SMTP id 98e67ed59e1d1-359be2eeddcmr14262339a91.18.1773153536628;
        Tue, 10 Mar 2026 07:38:56 -0700 (PDT)
Received: from [192.168.1.8] ([106.222.233.166])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359f05ee51csm3236016a91.1.2026.03.10.07.38.55
        for <linux-firmware@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 07:38:56 -0700 (PDT)
Message-ID: <755cee99-cc74-46b1-bc92-4ca9cb122107@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 20:08:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Subject: qcom: add QUPv3 firmware for QCS615 platform
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: K84wVI0W_YbQ1OEmuP0I1e_N8vpY75Wy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEyNiBTYWx0ZWRfX8q4t+5tV5h59
 XbuZaZJPw7Ras38gh+gl/z05/JM1SV8Jru4/M4FmoMhJ3ZnAhgWSJcoKUmmneZPlSUq9KjnKVAn
 XPAcdgqdKuMk+0D42SKWfvVMwB+XBLTXYYRS0lJs1fwTuVqT7RhYwGCrAglQ3mvu1+cj3pUsV0z
 2VSSxSDW7NarSyJTChKOANw4osr3RT3Jc2Dhd0lkWtcGtogtNSQH/ZC18MNsauLxXLR9hy7TstG
 Iz8Lp6YpF1oMX4msjlxETodMVDtIKyUCKqyOHPS1m3jY9/zWhD2u6MX+UW4WUegxDn53FINp+gj
 rHAJvidgQBzDPq5Z0CM4jXj1Pao8FssycUehMzIexuwWjpx7WHNn/jlm9pE8R6TuAGhY7me3AkC
 C5kyAhA/Ar9/PuqXvNoGDHHPJ/L4F/gnqYgUAp7zmq2SRznaDHAvNlMQVg2GHDuMZx2p0BI1FPv
 +CmTekzOsAkUogo4HMQ==
X-Authority-Analysis: v=2.4 cv=A71h/qWG c=1 sm=1 tr=0 ts=69b02d02 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=KTgq/n73ZA77TzgS7eMWjg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=qC_FGOx9AAAA:8 a=Nd5h9oHcvgu34RhS18IA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: K84wVI0W_YbQ1OEmuP0I1e_N8vpY75Wy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_03,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1011 suspectscore=0 bulkscore=0
 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100126

The following changes since commit c822cbbb14ce5b8ee1f27346220640ac350bbf34:

  Merge branch 'mt7922' into 'main' (2026-03-09 20:00:12 +0000)

are available in the Git repository at:

  https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git qupv3-fw-qcs615

for you to fetch changes up to 348a4f2eac666c33ee9c853b6610a860b48fd9b5:

  qcom: add QUPv3 firmware for QCS615 platform (2026-03-10 20:01:32 +0530)

----------------------------------------------------------------
Viken Dadhaniya (1):
      qcom: add QUPv3 firmware for QCS615 platform

 WHENCE                  |   1 +
 qcom/qcs615/qupv3fw.elf | Bin 0 -> 49235 bytes
 2 files changed, 1 insertion(+)
 create mode 100644 qcom/qcs615/qupv3fw.elf
