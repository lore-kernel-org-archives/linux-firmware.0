Return-Path: <SRS0=p7bb=CB=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8B76CC6B33
	for <linux-firmware@archiver.kernel.org>; Thu,  2 Apr 2026 09:03:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B3C66C2BCB1; Thu,  2 Apr 2026 09:03:12 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F365EC116C6
	for <linux-firmware@kernel.org>; Thu,  2 Apr 2026 09:03:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F365EC116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6327HGOm3044207
	for <linux-firmware@kernel.org>; Thu, 2 Apr 2026 09:03:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=oIrDOT8WeHiNospPtyPHyl
	k0Tts+CpGyCyTBAtDPdKw=; b=TMq3Dqld6VAhWyuBhN2E4SnzwdCALek9nm+76Q
	4lBr/TyhazSi9fo88aPutiUJEgYH0pT67iPpz1LxFVRcqxPu+i9R9gx6NB1ZsnUO
	YLHQYa+YwdtVBgg/texIzEZ8Kl5MjcRFWTfHkY4nloOwWH4PcSHDtOE8cscWrbYF
	NdJhQ59g741MeQff5FsE4hB5jaW+WOG4gaE/UeieCEs2kdCJtEySZzap+5GDq8qv
	jFW0/BfXLeDDTMFrvtgE/pz5Cb7bRUmjQhIlMnw8uOkxyKmyYZDd2XOAvqEaALJV
	My24PyQNQRYl0Gdpv6bAwLXP2EKfDD8ifD7C4686vZZGa9rQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9483v296-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 02 Apr 2026 09:03:10 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c76bfd7b9cdso316696a12.3
        for <linux-firmware@kernel.org>; Thu, 02 Apr 2026 02:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775120589; x=1775725389; darn=kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oIrDOT8WeHiNospPtyPHylk0Tts+CpGyCyTBAtDPdKw=;
        b=iYh+zAlA7l6osgoNlBI4huaTRXshTyEk/n0KcGyuL6x246457ejulxQ1wr1fp56kDU
         EpPgpPemNipj8GIxWtOfU81Wo01B1vAvT7X6BzFeXA7MFsHDT23hMjUwZvJ5U60F8hrd
         t5FqxcgQVE1M8zrbb8rOvqZvSrRrQFhEOzXl55DDYXWgPnQRwek0Qx592nRq5+muZy62
         punB5qfFaQ5ZFGA2swVZc9/7wOQiA/1+omyLSm8Imfk/GiFpGKAy88H79q5Pobo8mtQP
         9oGyIlbG536k3OJjfwhJfgLHXmy3gIpw+164pGcLe5mBS4ekpHbGmZWuiWo7cIdTfQWT
         L/gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775120589; x=1775725389;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oIrDOT8WeHiNospPtyPHylk0Tts+CpGyCyTBAtDPdKw=;
        b=IrH70kHuYPZ2dMdhBirKHMcgUmSV1oQ7QjwIMGOPK3QQTgp310qJLf6L222qjAI1L3
         lSiGsfOJkVHipaNqbc7CMbsPh+lx741DzlqsQrtDsdZ1ibaaof6TtZ7Tm/xOjwBWi8Ut
         ct7nMgEEhA/jsPfXO4sLkjBUvtBF9iWJfTAfPJlRADRqvT4QuNMDiNZ6FyCJX7rYgFXg
         pR4qO33sa/AIOzFCZyaph4LsfFs+fmRJ6yoDQqFbAsj3tNgiq0I3UkbBN4yBBytSYCXX
         yzhR5BGBUiVSMYRbvy3Bo7OHUzw2v53ShWWmYo3bPxg0AeGY2QU3WcUQjMpylZLcQ+Ve
         U1PA==
X-Gm-Message-State: AOJu0Yx15h21YpDFUA0X16tvd5loRqzj46Rmp3VMRUO8KQ7Q3Ysp8M50
	xjg/FHLwVLEqomUVgsl2ta4PoB7sdNZsxukVeujDw7DyBk70sp+FLFg4MnFx2MgEXydv1NQuRO6
	Bk+sliun0CCDtXTku8kaW5iqQnqM6Hdc107yOzi2oNcLzzfNmz4FuvNLxY/MJ0tp4539kr/0=
X-Gm-Gg: ATEYQzy9h9IICehpESVqbc1Zou0QlY9y3pjajSzcPhrLLPDzzzKRswMcMsX9/4ZKnWF
	mWmO2SPK91skI6hj409OfTAOoXDEf9REZ8oRaFYzOdAIAMNvKGpODG5eo0YW+TKNHa06WTIz6nD
	Hypm1yWPjlOSyzHdE5Ps7nFdRLhYh5L7Sj7DfEcdP3hvKlhTC00FF/X7nO+FE9p18g1X3K/LVId
	zkC+6ap2lSq0BIMHH27Tcub3A13XK6x8m2+kKIRycn/nLDkaINSRAhQg46Hlob+uYp3MKFNv4pt
	1UWsHsaSCpe6LrI//lHpJPdzr+8tTm23WQO/z3giLpPU2sZwQwtkupPihxe4dtP3ahgBa1DweD2
	LMFYNuaNpYYJrLYaU8UUGYiok08qDC6+QuT0xK7sUOCe6FPsRxw==
X-Received: by 2002:a05:6a20:4321:b0:395:3677:675a with SMTP id adf61e73a8af0-39ef76c1997mr7356918637.35.1775120589144;
        Thu, 02 Apr 2026 02:03:09 -0700 (PDT)
X-Received: by 2002:a05:6a20:4321:b0:395:3677:675a with SMTP id adf61e73a8af0-39ef76c1997mr7356890637.35.1775120588599;
        Thu, 02 Apr 2026 02:03:08 -0700 (PDT)
Received: from [10.204.86.92] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76c65995a9sm1958175a12.27.2026.04.02.02.03.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 02:03:08 -0700 (PDT)
Message-ID: <8eee8c56-3ed7-40e5-89e4-406060a5201e@oss.qualcomm.com>
Date: Thu, 2 Apr 2026 14:33:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Saddam Patan <saddam.patan@oss.qualcomm.com>, kssb@qti.qualcomm.com
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Subject: qcom: update ADSP firmware for sm8750 platform
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RYydyltv c=1 sm=1 tr=0 ts=69ce30ce cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=qC_FGOx9AAAA:8 a=XVsfLpG8jI4Vz9lwU4gA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA4MCBTYWx0ZWRfX0AZp+y7091o4
 yK5i628Y8602ZHgkinWNWQs823nd75H+xpTsJOG/q45GOWDkYbYRhENh/8/KsNxwoN4k+n7aWZv
 n0CogZBQsMUznI+HXh4niaLDkHhybrmxhmJJVcPqsJBQ6UX2gW7eMEafYqj0587eklPm/Gkml3I
 zkUdfr3wW15nJW7ZvOQEOjUCXJ71wzQgHVgpPRDs+BLWpminihHG7XLeiN0XuEEEnjbOMw/LkUQ
 CtzApeBPwlCL0SNR/SuRfhGIlUJ4O/lkSuFiHxthyZIC3NXEnOk9ztfbte0pQ88N0qUCOLZQHbz
 ResF8BOwquZLsCkJwS8W3HPfQkuvegix2OhyOZZO06EVIAq+JDq2owvAfi2jBXgRaDhlKN57h41
 k3Hr0/Z+ZEj4YBaaeGOuI4iSr96I+tmQdDPe2TdlDNSZUea14JhI2nmifHM18yQLhGS4sawX+lT
 bRNFS9B0WsySh60Cujg==
X-Proofpoint-ORIG-GUID: qdm209uQ_aTIVVyYEPZuQ3d6NR1AxsFY
X-Proofpoint-GUID: qdm209uQ_aTIVVyYEPZuQ3d6NR1AxsFY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020080

The following changes since commit 441bcf2eaa2a2dd6edbab83181a66a2db537c470:

   Merge branch 'robot/pr-0-1774880321' into 'main' (2026-03-31 13:21:46 
+0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
adspfw-pakala

for you to fetch changes up to 91651118052935080801f420ab0c5591c649bff7:

   qcom: update ADSP firmware for sm8750 platform (2026-04-02 14:29:06 
+0530)

----------------------------------------------------------------
Venkata Kota (1):
       qcom: update ADSP firmware for sm8750 platform

  WHENCE                   |   2 +-
  qcom/sm8750/adsp.mbn     | Bin 19413384 -> 17639864 bytes
  qcom/sm8750/adsp_dtb.mbn | Bin 180024 -> 167736 bytes
  3 files changed, 1 insertion(+), 1 deletion(-)
