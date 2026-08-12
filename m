Return-Path: <SRS0=rBuJ=GF=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA22C5B567
	for <linux-firmware@archiver.kernel.org>; Wed, 12 Aug 2026 05:23:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C16B51F00A3A; Wed, 12 Aug 2026 05:23:33 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1786512213;
	b=aavNGxIuAYceGvhl5SsFDeZSKqVJOTpxGCL+066FTL3Ifhc5vebYMMAu6xyrXqtAPjy9
	 wlQliQOCi8pVxwPUolq4Z+fWxKheLqifSZSLjEnPl3L7uj4hb9QTfgvsmo/E0npsD7165
	 HlkXQET40yNythWckct/49I1ZUVEtjgNafNarc5FkNtm1sqsrwRCaCWdS3SGM1B8PZ5W3
	 eu/1nqr85GYEOmhgWFhE7ZqKwAZj0EFgUzIos/HQuEmOQxIA1Ekb8EdUyk+lM4We6htZe
	 aFkbzeo3MkR/Ac+u01s1fSj5KnZV0QKC5HbQNGYednKxzkdGUI3JMZ8Qn2ooyUeWeEA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1786512213;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Content-Language:List-Id:To:Cc:From:Subject:Autocrypt:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=gDogIPo+bvU1WzfZfE97Z+Mi17tfjMtLd4MpRTrPm4E=;
	b=qupaNAkx+SK5n1ZChXb/ZvM3zd6OeVoJj0+jZtwLrwVh0DYBVfWCyWWMg8Hf+ui1dFIB
	 ITHgo8WnvO9g2rMdqMyLXpZDBwW9+1yNG0cpvcLMvUXW3NMzphsO3mp80jWVgrVm6sbkn
	 j6ca6pwP7PyOgkkxAu7eCTz5lorraPAk1YBotgnrrE78O4nBLG1ZE15917Ru6txdwGR5/
	 rWhFthRgPrHxvBT74HHMU4z82681OmAoWR2ZenLgZXgsgAgPKODVBpso+FSEFZKohEBFY
	 0C/eIateQReJtcyLNorpNzLFsxnc5O4lj/3wniZNw22xbXDTZzmmHURn8cJ2pdiriWQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PQ7WbJHg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="bEKcK/ez";
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 08F831F000E9
	for <linux-firmware@kernel.org>; Wed, 12 Aug 2026 05:23:32 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PQ7WbJHg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bEKcK/ez
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 08F831F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C4USsx2442794
	for <linux-firmware@kernel.org>; Wed, 12 Aug 2026 05:23:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=gDogIPo+bvU1WzfZfE97Z+
	Mi17tfjMtLd4MpRTrPm4E=; b=PQ7WbJHg87hYUPRumCzIId6PdCuaIxNVHgPMl+
	gQZqonpye4p1y3MgcugvIlNyCX3xq5H4yUnJXiYYnYncJg+y5XhQj2kTm5pPOEAC
	oMygllovI2QqReG1mocc47dfGb//duFOC/cghBxTHIzsHWk4Y9a0pu1VX4VSfzeW
	wa9LgcHew00bB12xFhstBNu498HEvI398PUMkm/2Z6BdybfJH1MIQTdqmkeLWXNB
	uLAsvPQU3HfwlH/zA6OTORBsmlTEiLiVZ5/zzT123YtDo59LwR9/zFz1rDOPd+HQ
	xYJ4mXmHUIokRNsGmZJnVCPrOhUKPAkT5XG919diw/Musivg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g049mkh7s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 12 Aug 2026 05:23:31 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e7b87ce77so1404545a91.0
        for <linux-firmware@kernel.org>; Tue, 11 Aug 2026 22:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786512211; x=1787117011; darn=kernel.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gDogIPo+bvU1WzfZfE97Z+Mi17tfjMtLd4MpRTrPm4E=;
        b=bEKcK/ezrIlQa33Zz3XShK8yVFd9BpjMuzlJ8mSFjUUswol0x3kt8VI/S1mAlr8zFa
         Yl8Y57TNU3ly8sjP6UZPhojvY9M/dEU4fetK8LVAGL0Jol6DbnT7xwBcu+V351bVVimn
         UMkvnckQJskV7CJ9VEu9CEpM2Rh0hF/VdNWCVqAbx0XDYEdOz0Lpp1ypvpmal10NfJIY
         Nh9TmhGetzgimruVqJml5o9rM8ExrCeX/IJykk0l3oKHecyNybTRIGodWYTkAHOWPzGp
         5a+U9Gc7ueTkukAMw04G63hxN1x9WBY4XUSkbOL7pA1ass1cAaXLLzmB29Eou408EHwd
         C+9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786512211; x=1787117011;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gDogIPo+bvU1WzfZfE97Z+Mi17tfjMtLd4MpRTrPm4E=;
        b=re3DPaNJ5MsND8g+QhSL20U6VqDj22nm3KeZ0voE3kep4uNLcFzLTBFM49s8rIRERB
         QdusicUuDtJfm/tlrC3ZmiZuX8I5DNllRiomvNDpnKGtDM7bF20pq7jeh5DDrlWCD2pF
         /2KqXpcRp0HnN51lr6lCMUDBzmag+/VatlDaAbhjJ3sEQ037lPuICYJoYuUDvPWttTxi
         QoIEc7e8jNn/3UWvWiu5Tp5Gx9RjUF5EB+XQ0BHlJci/W+g4frNi916zK6COKRHgTlJM
         kHIAuKuKjq++esFm+8AeMgOuyGNcaUZMFajQqEhm8YyQUfc4rFQbBhz6S+Stok7ehyZQ
         Qetg==
X-Gm-Message-State: AOJu0YwXlNvbIkIDdJm/ImQWQkHmA6yxwgH1mjfhEWNmCyjl+YfLhvPs
	vQgb7EGp3+K1VK1Y4+oRUvLUBQWNt35l80hzTtGnUPuF7IAesMvHUxWnbsCkBcqB5Xlb/zli+rG
	+PJT9wkOhxSk3h/pc/guBXtgn1wQ3CKhtF/MlrjLyQKtBfLiHdEremm6kqWLwJXCTK7Jitgk=
X-Gm-Gg: AR+sD10Q4PaKv4MQEeKsaK48jgM/qgki6tV83++m79yhh6dN3cf7MTI4ebW4E6v9gEb
	CkUbugJZ6CKL4H4c78fgV+zBYT62ObNiqEmNnTPo+LKebNVska1x2FX84IcPWaMgMZW8tZ1plRF
	21yC6OgDMlezWTCSgPhQWLvsoX8kKIUfXXBVmaiI1sNACVBupBqSBF9ctd5hEIcgSW/dfIQwFsO
	0brf9cae/V7G9YiQIsIvt2nQXQ+kIM5k/0Y/atZ+s1tuy5ZxBtKCo40RMv5ec/2AduTwMSUfI18
	xjpKVeBOFcHe/qpzf7iBp5rNEhg7PKpIbr3/kVQQCfiPmr2wn9CXIt78tD4wOcJ3VnhCJiRIM70
	7W7GY1bXoBJKyWZd88Q3q8J7nMANA
X-Received: by 2002:a17:90b:53ce:b0:38e:6c37:d95a with SMTP id 98e67ed59e1d1-39301480fc4mr2820354a91.19.1786512210696;
        Tue, 11 Aug 2026 22:23:30 -0700 (PDT)
X-Received: by 2002:a17:90b:53ce:b0:38e:6c37:d95a with SMTP id 98e67ed59e1d1-39301480fc4mr2820303a91.19.1786512210234;
        Tue, 11 Aug 2026 22:23:30 -0700 (PDT)
Received: from [10.219.57.13] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392f8901c1bsm2129410a91.8.2026.08.11.22.23.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 22:23:29 -0700 (PDT)
Message-ID: <0cd244e0-868a-4cb8-bd0c-fc2ff029b91b@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 10:53:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: psaddam@qti.qualcomm.com
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Subject: qcom: add NSP firmware for nords platform
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: T-C89W0FMtEzh40MJdrjRDQsvTSY2Za4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA0MCBTYWx0ZWRfXwnHS1/Z6+DWo
 cj0SC8KZ8ofvFWmKiwcw4gr9BTRW3XFfxO3rY3RiPES0t/jvPaJUI+YAhuvqsFwCcuDimmPlm7g
 XRDfmcBjefQh9O3UJ0TNt9AaunNZtebFsj4NiNvlmXw1pWTWbm5vuSto5F1Rx7POsii3uO5DGX/
 41NfuYHD9C2J4ibxUwxVvji+/Lk+1I54OmGdQbx/DjnOFrF0R9CemC5ebWlfaWuNyUpPLiOlKG8
 aiWVljU5/eMhN4xejvbXLt/WxNY2oBQL7K05ABj7sfErFlwqD/z8OwqJDqYofaMHT5iMRDZUlQ0
 RSKw7NArgGcHb45moMrfPK+k7yRP2avFRDci5zkYrvV6rscLzur+7J99duNB0kJ/ovKv2ITfUJs
 en3KaHmF8MAB1Su/Gij197cfVt9+Q3rMu2R73xgwx3q/wpcPx2Q9wDNYTQIaHavMD9vTG07QwUq
 Q/cRlN95eUV3xMzEm+w==
X-Proofpoint-ORIG-GUID: T-C89W0FMtEzh40MJdrjRDQsvTSY2Za4
X-Authority-Analysis: v=2.4 cv=FbkHAp+6 c=1 sm=1 tr=0 ts=6a7c0353 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=qC_FGOx9AAAA:8 a=48fhFGFewW8riTjQOwEA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA0MCBTYWx0ZWRfXwzE8fmVjOEUf
 5p8Vm/HigQiTFSHdR9MuvVEmGDIn/NYfykTtq0piWXN1neouh76LVRM0D0+N/3r52/u222Ocrgu
 CfhSfxk+Y4Kt7rW2SHP5uXi5RFxZ5KQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_01,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608120040

The following changes since commit e3c0c4b70f50ae77bea557b4a44be04413d3f3ed:

   Merge branch 'robot/pr-0-1786456716' into 'main' (2026-08-11 14:02:21 
+0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dspfw-qli-nordsnsp

for you to fetch changes up to a31906642ab7a73f5759e2c554fa2065ca548c5e:

   qcom: add NSP firmware for nords platform (2026-08-12 10:48:05 +0530)

----------------------------------------------------------------
Venkata Kota (1):
       qcom: add NSP firmware for nords platform

  WHENCE                   |  13 +++++++++++++
  qcom/nords/cdsp.mbn      | Bin 0 -> 3347164 bytes
  qcom/nords/cdsp0r.jsn    |  22 ++++++++++++++++++++++
  qcom/nords/cdsp1.mbn     | Bin 0 -> 3347164 bytes
  qcom/nords/cdsp1_dtb.mbn | Bin 0 -> 131072 bytes
  qcom/nords/cdsp1r.jsn    |  22 ++++++++++++++++++++++
  qcom/nords/cdsp2.mbn     | Bin 0 -> 3347164 bytes
  qcom/nords/cdsp2_dtb.mbn | Bin 0 -> 131072 bytes
  qcom/nords/cdsp2r.jsn    |  22 ++++++++++++++++++++++
  qcom/nords/cdsp3.mbn     | Bin 0 -> 3347164 bytes
  qcom/nords/cdsp3_dtb.mbn | Bin 0 -> 131072 bytes
  qcom/nords/cdsp3r.jsn    |  22 ++++++++++++++++++++++
  qcom/nords/cdsp_dtb.mbn  | Bin 0 -> 131072 bytes
  13 files changed, 101 insertions(+)
  create mode 100644 qcom/nords/cdsp.mbn
  create mode 100644 qcom/nords/cdsp0r.jsn
  create mode 100644 qcom/nords/cdsp1.mbn
  create mode 100644 qcom/nords/cdsp1_dtb.mbn
  create mode 100644 qcom/nords/cdsp1r.jsn
  create mode 100644 qcom/nords/cdsp2.mbn
  create mode 100644 qcom/nords/cdsp2_dtb.mbn
  create mode 100644 qcom/nords/cdsp2r.jsn
  create mode 100644 qcom/nords/cdsp3.mbn
  create mode 100644 qcom/nords/cdsp3_dtb.mbn
  create mode 100644 qcom/nords/cdsp3r.jsn
  create mode 100644 qcom/nords/cdsp_dtb.mbn
