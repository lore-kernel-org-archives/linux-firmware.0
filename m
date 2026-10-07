Return-Path: <SRS0=gj+A=H5=oss.qualcomm.com=saddam.patan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2806CA5FFF
	for <linux-firmware@archiver.kernel.org>; Wed,  7 Oct 2026 07:10:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 881AA1F0089C; Wed,  7 Oct 2026 07:10:14 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1791357014;
	b=WOSMnHdyrxVYw2Fpxdyk8Zp3nNHlpxraYQAZsBOdLNEmb7rKa4qrglAphlkGlbYMsRto
	 1tcQde3nAucVfA9wh7OLGitQxAOEcd/eZcpsk8u6edr35IkNN+X82o3FfTmK/8b3b5dnK
	 7/voyCav1ukbMqWHNYI7lo0ttfI4i5ZycAM4doZmATfv+e2CqlQ+D7R/dFLriT/Avm7ps
	 FG0bsOr9e4iZ9X3Jyecjj4JB1UNGoUPAteygfP25d+goHsRrqZ3m4nQB7UlG2nKKnlpM7
	 D4gB6T2UBduUHgU02M4NzVarb+iqdk8THoChtRFlMGOibQQmeIPouPMj5dk6YuVChGg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791357014;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Content-Language:List-Id:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=BQQE1iEfH/kc63e/R3HdA9tVWc6+4AazsWpNi6oIyqQ=;
	b=uqSDIAdTItc0ONZ/bqJssLKB1tJdIW3Xh9e8xN5EV3fwpsXpMy+1HidV3awpZSSKfQfq
	 rBDPUJJBraybodkFXQ09VOTuslgN3dwbQjYxgmoHwkKyT5VHjs6NkbwcDUQxU2zXEF+62
	 V7VEv8MP/874psVlAOeO1kac7MrO9S+/Km8Yo6XovEqXE1MHYxEUiBmWa9sSGg+Ne/Gba
	 /flLXwGq4GmtqJbbh7q/tUtdAU6YpXD14Uuody+zRn9KxocLuU1frRjdwzKAkIOxDGcTR
	 4xVn3sccwo1h5dzijDda4K4+SmwpCV8bunAYPgyLYGDYXKIfKYHP1Y1AW5XvyhWmysA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=buqB54Mg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IqqkI8Lg;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C4E9A1F0089B
	for <linux-firmware@kernel.org>; Wed,  7 Oct 2026 07:10:13 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=buqB54Mg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IqqkI8Lg
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org C4E9A1F0089B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6974UCi52774157
	for <linux-firmware@kernel.org>; Wed, 7 Oct 2026 07:10:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=BQQE1iEfH/kc63e/R3HdA9
	tVWc6+4AazsWpNi6oIyqQ=; b=buqB54MgeOBB7AMvtEXBfH40b3IVgEXpAxeJTl
	zjia9s8sujQAdXhAiV32memUAI2jiOyEkvrQBudc2YCrWH9Db8OYhdBN0NBc2B1a
	hIvJwJn0UPlCO3K9nbQiTrAvvK1JszF8xI1ZEKskZ1PNuRmipsXsnsW1K/CYTu6a
	GqhJFlYA/yKEriNSw5lJQpkfOcHMBWbyudP9lutM2dq/RQhBZ0HU5niaaFeX5tsC
	wJk2bkVwb43bSmpSYptmpQJSH5i7ADJVG6bzKCumeuZ5WlmFkjy9X4659PCUOmU2
	5ZASsYxrMc+fB8ipo3LQKIZccLO9Go8EwRtq825Pg2JaxSDg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h541uk5gq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 07 Oct 2026 07:10:12 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3a47a81e70bso3937115a91.0
        for <linux-firmware@kernel.org>; Wed, 07 Oct 2026 00:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791357011; x=1791961811; darn=kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BQQE1iEfH/kc63e/R3HdA9tVWc6+4AazsWpNi6oIyqQ=;
        b=IqqkI8LgD4Oe4Yb1TE4lTXlh2Ut4ao3mMWgKbOCIQI+JO3omakHnrvr0FOQPKbx8iZ
         i3MHmrvUgMfl5HRcdVh2mIGu3L7TQ5xrNi5rrnUQYfFDjjltxvi8yuQ/nvjBilUe0uwh
         vKNovifeUn4phNOco90eiOxpUcgIdmsskeieJNwix4W2jG9/GLJYl2ZC7fyTFTLFYm6h
         TRkZqiBFp6SAxwAGOPDVhtYW4jCyN3qZS2gaIPXuFgpU3xRflLcQBSWYUyMm9FPVGUd8
         ebZPiCI19/dPQMseJyR3RpLGcK/T6wAmZWYRJPKdEEg4a8T2R2NEL7lft17ZkF0SGd5l
         AkRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791357011; x=1791961811;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BQQE1iEfH/kc63e/R3HdA9tVWc6+4AazsWpNi6oIyqQ=;
        b=f7LSzSebyPdms3uixwbZWughkrQA8d4DCqsrLSYzJ3gSfyil5gdI0Helb1ALAeq2wh
         OxKQl2IoCiPcduCtHOJs/tDoQA5IfYxsz1bfIKXwd8QdB5EF1AkOKSV+I7Js2osr1nIj
         LTm3Gl3MIGHA0nUSuUJ/PSjWaoo1avxl/O4mfXZ87l50CPKXRM/bM3rlfPC3NwgW7UaY
         mWd5LFCknkISfw1szB2SFEJpsEfGM9RjnIcbYR3xUQ3pW34vK9jGX+qSc1nsp790U+6R
         jO00HNk5Y21A2smH2vQc48uqnLr2ysoqDEvquST1XzjwcH93BPL+KQ9k/qV/yGoMi93i
         FOWQ==
X-Forwarded-Encrypted: i=1; AKwUvBwjHsmeK7+LnRzlaukXsaH4Kl7qDwcQmPTBVyoMwzKXfMPyTWF5OAZphZlKFWaSO8vYuEaDPF0zRHZd9HH0JQ==@kernel.org
X-Gm-Message-State: AFq9FYJQ/1C2VZq4qODNjOH8dski4iBrLYsB1+6pIfrElLwDIV3Zq64f
	l4a6f2ZyZFjZ0CLxynYAK2d1PNNE5xrb5P5IT5GsWbfZXY4ND0YaDWiQV+MC9k/Kc/vrkCnBf8i
	/BJ/0RlOxJRdtJgSz4h5XJiAXjGliPN2RJdwImek2ya3tvkrbQct2XPo0sjhQWQf31niWB1Q=
X-Gm-Gg: AYBFou3bKBUPkVR40ULsdFs+sAAXOVYJt1/bhgfVAI+uA72GAmgG+h6YHBGufB0gwl1
	YNxeotzAnXW3P4biL2o/Oofxncn/qKKRTOCIzfaeLUZpf75FYvR41+/P+CJmoXLgX3M7zKXznox
	Sg+WmI0OVoAf9mu68qj5OhSU7xl92F+G/GjH2rBb+l4mEa+J63kqMlx01hmRia/q9TZBUxTBhA5
	L867BuUgJ4VrUJFfFvflvqGBawyJlWyEmNxvd8x4RdeMdleTu3u69LjR/AbHtLV/RLgJx8MAz/v
	ht2lVNHSRPFVGiNVTA+jmBkOSuRSEEG/G9AGszC5w3jLaEidX+VA+3ol5zqt2jsmpLXiNFM2q6c
	x+1c3N6DinsMbdjvoGPDohX0Ehgnv
X-Received: by 2002:a17:90b:1344:b0:3a8:de1:db07 with SMTP id 98e67ed59e1d1-3a8a0835f61mr1275970a91.5.1791357011446;
        Wed, 07 Oct 2026 00:10:11 -0700 (PDT)
X-Received: by 2002:a17:90b:1344:b0:3a8:de1:db07 with SMTP id 98e67ed59e1d1-3a8a0835f61mr1275952a91.5.1791357010839;
        Wed, 07 Oct 2026 00:10:10 -0700 (PDT)
Received: from [10.219.56.173] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8987b1e1asm3278695a91.1.2026.10.07.00.10.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 00:10:10 -0700 (PDT)
Message-ID: <b9b5e2e3-834e-4f0d-b1f4-19a3bd024820@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 12:40:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-firmware@kernel.org
Cc: venkata.kota@oss.qualcomm.com
From: Saddam Patan <saddam.patan@oss.qualcomm.com>
Subject: qcom: update ADSP firmware for glymur platform
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: df_Ga9XXCInE-z2WCxGYZnceIgHehKS7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAyOCBTYWx0ZWRfX8LGxSpoY1Mg+
 q1a+VmsexSv5X0ztF5mq2ZvMPrTOm1UxcQxX9cEsjwJRJI4Ezkcq1pCRD6QWTTLCea6GZgM6w0Y
 p6JmP1nsxyRUyt2x1ag7ti9xRWbeVXQ=
X-Authority-Analysis: v=2.4 cv=XZYcX455 c=1 sm=1 tr=0 ts=6ac5f054 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=qC_FGOx9AAAA:8 a=sO8OItCnr9OBAcLYC5wA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAyOCBTYWx0ZWRfX5rgcqbmVjJYS
 BC0qt1wsHxSQvbQGCy9DXan5GS9B7Mi+fjBItX6y8Vda4niQ5qyYXjaf+Vx0Liie0O0D4ZHSOOA
 oNn9kqhJUAaw5C7GyJEJ90imanpGnO6TnS/GZEIiZbu0VuWDDtoEBwvkzlBh9FuZqtNvDpRJbaI
 wQD8+E4dE8wrY69pWy+avMzSkHRr3/NDkydroO5pLvAQD1c8abj0/6/YQPjEcUAiNWkIlOWkaJk
 4V2SvZe9ZvAEWZb40a4WWJd66tqc/iwLZ7XZaM+bOhgJbU3k5T4/GZrjbvD5OUuts9DunksiwLS
 hXzin2MmpPLHvEZcvgxgFgPyZnnxtFcbpsy6jc1oZW3ZqChuImcFvapyxkyNfoZ+vIkLMz18rIA
 f06jGXRGQPZGZa3w/NshyiDFQb4JNTnm72qXIg+finYiy/imUZyJVzgMLL0SZopFcTbEa93yr8A
 oA0l8NI81YXURE112Og==
X-Proofpoint-ORIG-GUID: df_Ga9XXCInE-z2WCxGYZnceIgHehKS7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070028

The following changes since commit 79104f902411a949afe1da25dc25e05e3160fab0:

   Merge branch 'robot/pr-0-1791302343' into 'main' (2026-10-06 16:25:17 
+0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dsp-fw-glymur64dsp

for you to fetch changes up to 6b5ab2d6f06018479dcb6701980eb508714896c8:

   qcom: update ADSP firmware for glymur platform (2026-10-07 12:33:32 
+0530)

----------------------------------------------------------------
Saddam Patan (1):
       qcom: update ADSP firmware for glymur platform

  WHENCE                   |   2 +-
  qcom/glymur/adsp.mbn     | Bin 17070040 -> 17053656 bytes
  qcom/glymur/adsp_dtb.mbn | Bin 225080 -> 225080 bytes
  3 files changed, 1 insertion(+), 1 deletion(-)
