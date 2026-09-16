Return-Path: <SRS0=5H3F=HI=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02735C88E77
	for <linux-firmware@archiver.kernel.org>; Wed, 16 Sep 2026 06:47:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CD7BD1F00893; Wed, 16 Sep 2026 06:47:12 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1789541232;
	b=2df1kQje4lgxyk+dXeL9LLIGQKj4PcDg9z7peOjVeqzITimKw3BAfI6mq7AfozX67drP
	 vsheqAFj/IsrG3uvFpyiJFrJb36BNwJvEfB9NN3x7mJYbs57U4kYuzJDlBJs82pOgRYop
	 tpiTd72yFYT8RGeigrJy/vRL9lFkoznc/4+ckU+Ve45dVqbSbMAhs+prKbfEad+ny1mwU
	 H54AmfsVvp2a97kLLVgZGYRXNhXFsulJDPq7tZaMWtO2ug0ffQhu7fRZ73QQdbW6VVrBj
	 DLYxaRnNv3ZrhC5PI/F9yvpkifxxKL5F2IHQe9bCYF5V8PqB/sathirJ8xjQZuURGJQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1789541232;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Content-Language:List-Id:To:From:Subject:Autocrypt:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=6qlnv2j7Awxp1gChz+OBvdxUg84jgVedXpmlXHmyZ/k=;
	b=D6k2RhQORjJiRmtAGBUtDUEvbb5rj42JiM932afNuR+vI2G9FitYxCcACfJPa9hppgJV
	 +yeAzZJnctLyrGO7NWrQa8AKjA5zWiAtaxUHVrML8uivUKgLSGRFaHEYjfs+4Gz8LCYaw
	 m2MeuhrK7ZPr2Q8dlFHLgB2wglfOJKSCLlmGwRZ+RQgfswTHfinkV0nrAdwKCUHy34YEL
	 Qpm2yHJ32xunMrJY6chyB+t1TRg/9mpuOI8NM2YNNB9tqwloUYuemFubVH5zI0GQ4cwEj
	 1LQ0c3SjcZmMi8je2NWBICsrQuh9MgrAQJrNMa1yYXQ4nD5exe3niqRxMqSkgrvdKBg==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l09t1nwU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ef6l9VFH;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3A9A91F000FF
	for <linux-firmware@kernel.org>; Wed, 16 Sep 2026 06:47:12 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l09t1nwU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ef6l9VFH
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 3A9A91F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G68qLh1955920
	for <linux-firmware@kernel.org>; Wed, 16 Sep 2026 06:47:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6qlnv2j7Awxp1gChz+OBvd
	xUg84jgVedXpmlXHmyZ/k=; b=l09t1nwUEG48KjXSpLHyqB367s1F1N8RocxAlz
	kzjPILeKXIxa/XMaEHln15B/pnwdQHGiUAgqhxbivLOZ5XSa4z+BDyVhXS1wY7w1
	yrq+X15jjtYoVAPg3NchUCRrdMWn9BNXkmiII/I3DKVOzzOHtbIMDEVmtyPV3Hhj
	+NU1oydoLkFQDEp6JnIQVKRrmZYKbIOQz/L0M8+b0pgNmlUoANeBYa/eDQcUiETI
	+HXbD9M9XXtP8QQrGPD09c63GWbwb/tnewDgBTkRoOZi63esG/grqGyXovssKfr/
	IuhLXWA0l9WI+qPzISF4UqiEb5o3xuoIORyWUYu7QDsPBngg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqdyw9v5b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 16 Sep 2026 06:47:11 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so4235964a91.1
        for <linux-firmware@kernel.org>; Tue, 15 Sep 2026 23:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789541231; x=1790146031; darn=kernel.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6qlnv2j7Awxp1gChz+OBvdxUg84jgVedXpmlXHmyZ/k=;
        b=Ef6l9VFHViUpCvJzIZpAd3LfrQT/SAFb2GFHNtKm2fda5bzan6g183+oxyjumm2m6G
         oBAhLih5QwwCVsXzNHUM2aJVVoc+4KOma0H4ZJnSaWcyzIyZEAzaEOlpzm7ySGedzeL6
         vdw8wRV8YRKNVagu+iqsSFuyZnpJ9DXWMQqszGEobvHquFwZVKeGQrrh60GBsdJ8DPRD
         qNiE/zfqZychQv1gY26eUs4ivrG5zQhk145nrBDBaIVGKaaHIYXfHM1giXD4VtERb/MW
         bfwomQV2FyAQxAVkSLhlvPUBnJbMk9VaH9u4Ery1g5AEfQmjIRKGcYsnaJ16nuGh9RQP
         xECA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789541231; x=1790146031;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6qlnv2j7Awxp1gChz+OBvdxUg84jgVedXpmlXHmyZ/k=;
        b=KC1hpsxmUHFPylK2+fFWD1KrRvKj8MpQXLy6n/2Dl+2YdBxs5I8nYwyZr4WFX9B4ST
         tocErD1gxvr7r35vRta7eyVLaBcaeRfePRl6rlvOkc2ZYSzGlllctjE+1kBIDVfZ656d
         fsnL+EI0gQkuC05LsvZW0tFwpyiSS+Jx7k9flm5MJlIjHlOALhRlhN3QQJF/v8xn2sjq
         oJoKQfjwKpIDVRMA/mCQ5gFGGUK1FLG6qcOOW1PrI7Q9i7ZNjvwVGaMdjqAnC3qnvW+g
         ZYmOtity37cfLZug6LAe9BVa9G/NmdSgtYw6/pcGy4xVhxZeIaiC+eNh5z8mi93pg3Pl
         jRyQ==
X-Gm-Message-State: AFuF++mIsqB2G1iIvhHv6Pvb/+bg7n1ob6uBXgEpF+34vIREsRzwzzDH
	nYTku96j66JTLC6IlJWNztvW3D/ZqRw4BGif0XU/U6FOJR5HYKqd8Wo31cYueSTl6UPOhrgwF/N
	o2TL4lGH0Eefp/Y7npJ9PyJ89l50tKAGWqM9XDCyh3TiWqLPRFU++XYSqyjpc4nanNHWURIE=
X-Gm-Gg: AYBFou0qG41M8mxtsxMO1jhILc8bZoj88vkfu6G6u/5pF3Km0lP0z7bMHD9pB8JTV65
	zfDGRiuWIs4JGwnRF56MKKqpQgCOKXPyigQeletzZ+8aEteMiRimdmr78zvHB+SsAngTXjULS5R
	deCjLWn7+9uIJQ7WyivZkZBU3oyYeMUM3nCt/AjzJp0iRaJU03WZxFUFCDprlct/5209GpX0BLh
	z5X+gVa41Bfg/LSyF3WHwv0lOjku6ehdSMekci1Ej6Vj0vZT/RrDnZBDW+N1sHNmq+iY4pmimsm
	0IiqpBHH/OF0vCNS8vQfFdPmUwQglx7AVKogmP16/44L+lU8JqnwQCmYeWN7Md86Q4uElWwEkNQ
	EiE+vqnhMkI66qbSOsYtuNk7BertD
X-Received: by 2002:a17:90b:1d44:b0:39e:1693:c3c1 with SMTP id 98e67ed59e1d1-39e1e4c8bb8mr3532308a91.17.1789541230709;
        Tue, 15 Sep 2026 23:47:10 -0700 (PDT)
X-Received: by 2002:a17:90b:1d44:b0:39e:1693:c3c1 with SMTP id 98e67ed59e1d1-39e1e4c8bb8mr3532231a91.17.1789541230104;
        Tue, 15 Sep 2026 23:47:10 -0700 (PDT)
Received: from [10.219.57.13] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395cacce6sm4126090c88.1.2026.09.15.23.47.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 23:47:09 -0700 (PDT)
Message-ID: <3f6452f1-b7f5-4631-881b-b524d2848cd8@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 12:17:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Subject: qcom: add ADSP firmware for maili platform
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: gFPlXvDB90kfCRhvZUbxPNkSYxAKqfJA
X-Authority-Analysis: v=2.4 cv=aJ1lOr9m c=1 sm=1 tr=0 ts=6aaa3b6f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=qC_FGOx9AAAA:8 a=aZCC3pO89FPAhJvjr5gA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDA4NSBTYWx0ZWRfXwnqbcRPRZHuv
 9UJCmEKo9m54Dv1VUbMeVErY06lNTl49cj3NUpAqP7L1GHwtGfcJ2U4P4T+cIpNNHOOM8Ag9nkF
 CfkgB7tN7SvqXxUmEKDX+837TiGJ2cfrvKYlRnQtpgTOFTKezN1KqCLqOYwICA3hy5Rwv7TrlnC
 1erLr2iflminYb73//WLuT8C2XZx1Q3dXHnLGCDanBEEyZ7CbWgCXVaoak24bY/Vup9tlQXqimG
 QxzdmxXus9u1dmqoyno7SSfatH/3ApNjBO/IyEEAhB6LANF30YhO6sXR9zAmF8mKmsVymHJveAQ
 Mj6pMfv2nl+A03z5z5thOEL8r1LCla/lwL84MOn988PoDCalWquvJG/cNen94vNZ2QlB2jeIGoo
 yRuYK6mtyUKDjn7pcECl6iLZqukAeKS04UeAvOdUaM7t1QxOBEEQ0pN5CXOsEHEOCsQtcXRApzV
 oI8d8IX4rPExqqVhCEg==
X-Proofpoint-ORIG-GUID: gFPlXvDB90kfCRhvZUbxPNkSYxAKqfJA
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDA4NSBTYWx0ZWRfX7TEhOK7Ui2h3
 dsIspKSvKp7rIxlD5/CFowpZ2U5tY3ZVt2fqLjDSAfrbgmsULr3TtMb9SzSREGMIu778ow8MCCR
 X0u3V13emiZZ8WLsLgQB1/5iRDhjWl0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160085

The following changes since commit 4584045b21217268f94a4a2a203d05545345d313:

   Merge branch 'robot/patch-0-1789459360' into 'main' (2026-09-15 
13:04:08 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dsp-qlifw-maili

for you to fetch changes up to f060314cfaa136d27b0a5ae35193ac9d2fe7ee24:

   qcom: add ADSP firmware for maili platform (2026-09-16 12:14:13 +0530)

----------------------------------------------------------------
Venkata Kota (1):
       qcom: add ADSP firmware for maili platform

  WHENCE                  |   9 +++++++++
  qcom/maili/adsp.mbn     | Bin 0 -> 20707640 bytes
  qcom/maili/adsp_dtb.mbn | Bin 0 -> 204616 bytes
  qcom/maili/adspr.jsn    |  22 ++++++++++++++++++++++
  qcom/maili/adsps.jsn    |  22 ++++++++++++++++++++++
  qcom/maili/adspua.jsn   |  29 +++++++++++++++++++++++++++++
  qcom/maili/adspuo.jsn   |  22 ++++++++++++++++++++++
  7 files changed, 104 insertions(+)
  create mode 100644 qcom/maili/adsp.mbn
  create mode 100644 qcom/maili/adsp_dtb.mbn
  create mode 100644 qcom/maili/adspr.jsn
  create mode 100644 qcom/maili/adsps.jsn
  create mode 100644 qcom/maili/adspua.jsn
  create mode 100644 qcom/maili/adspuo.jsn
