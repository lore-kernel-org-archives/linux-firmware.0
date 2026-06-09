Return-Path: <SRS0=l0bg=EF=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1138FCD8CAE
	for <linux-firmware@archiver.kernel.org>; Tue,  9 Jun 2026 05:33:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E62CB1F00898; Tue,  9 Jun 2026 05:33:09 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1780983189;
	b=WCTMWFPYF6nr9XgSoLD5IXCMnqiCzE2J1grS2mUQ1FNXJ6Sb71fIrfBWNz339EVTuo70
	 WcsA2uLSFe/+7zGldsQd1zJEImqnJhafl97T3uacQdPTONQlKGj/1P/BBG48IyuWE0QPA
	 W41zhmDHLe7SzJzeiQ9wUgWTtu4YLj/cant11zOiqS+v10TL0Cu+onmWqMr/l2bCH6fEo
	 5tGctX6VKfFIBDcUZaU1ZSSkI2wAGBnQZSwTwslOaXmiExCghpIv0FUnhkxjhIcdr01Cb
	 1xAIdmLMV3BDeHotKQiTeo7FfSL1+GaQg04mPH4NNCkbfP/XJf7k1z0m5lKEj94OPzA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1780983189;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Content-Language:List-Id:To:From:Subject:Autocrypt:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fsBETsl0FOLwbDrmx/tCJhLpWsjHKFJrf6xeStUbkK4=;
	b=gVCazpw4wn1xr95NLIQj2KsGkHYxFd2U8Z0xnC+35lSyTMEMfQFbE8C8a+TKRt25xJWS
	 0qsCOyi7a42kiYOcqDxpBjSPqJrsJVKH9fCTk0ksbE6LqUi6ANMVqBt83Njn9YkG80S7D
	 lsk2ABoogw3A6WiM7SEiKVJYFGCpWFTTNiaq/0A4B3YH5gqAFZyupQwez6RpOs4iKLADn
	 JtDeL67Eo+QYXiWWapmziLteQ4sxeSZnFbP8C3fv/powVm2T3GW4YsxKC8WpPZ5G4dLYL
	 ylLdd6yCFD0+BZPS0zo5hujZYgwxxqJg7g0oLrBA4f0axxD28A2UVpnD0oz5DrKoCzg==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NO1B6r3g;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZHlcQxQQ;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4D76B1F00893
	for <linux-firmware@kernel.org>; Tue,  9 Jun 2026 05:33:09 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NO1B6r3g;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZHlcQxQQ
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 4D76B1F00893
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6593wjuG945017
	for <linux-firmware@kernel.org>; Tue, 9 Jun 2026 05:33:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fsBETsl0FOLwbDrmx/tCJh
	LpWsjHKFJrf6xeStUbkK4=; b=NO1B6r3gyEsLFNnXRDkXQT1FUYfpUs91Udvo8t
	V6oq8otMqLrAUiuedWsOyd6ZY5FcOZHqR7/9ls5D2KpSL/UptjQfGLownN13PSBw
	eIvcjoLuyU1trxcVTg8TniSiBhozZ156dg505LTadKr6JDpn9BYXA0dMVGNnDOQd
	shX0jFawBDZjBVnLssoQRWmhhFA+uE0SJ5whhZFYjHDGrQqxaQZlrYpeggO8QBHk
	fKYUVTnVW7rOHjK6u4hYxlG5LNuMiwJcnS4hffJdBN8kUOlc/EgMbJ0JGOkBARDM
	XrjVDF+TakbbIkojGLtzsrjKazfDtDTU597jFkJIWBntDw/w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enxx43vu1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 09 Jun 2026 05:33:08 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8421f5d76aaso3434095b3a.2
        for <linux-firmware@kernel.org>; Mon, 08 Jun 2026 22:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780983188; x=1781587988; darn=kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fsBETsl0FOLwbDrmx/tCJhLpWsjHKFJrf6xeStUbkK4=;
        b=ZHlcQxQQqaz9IDWjkZeCR6o3faliNrsmTeIsKgWLzh3WK4xq+8Ip1iIG9sXSEyFLmB
         2nCPC8LhLOcVvkGtWxyJ8+q50b9jhMZ2Ja1ECrkLyGDpW6178j0E4PUTw6WrAeZBZHSQ
         7RUxFFC+t55MskKo9NAjDxAYLR4/nT+18KfByWCKjUkHT9mLQ2ExRs6NegEw/n6dmZj0
         P/UmyFidECy2VHUyNYusq4cKKlF+Y2RDxfTfkikNgU9qG+curOu/LKcbCg6JyuuhhCop
         jgniAnWvcTUKrSi75uTHNlUMPJRHfP0tJZPhg4Hn3mRsf1zlHSGSeWW6cjZWyE+yP9t7
         i/jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780983188; x=1781587988;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fsBETsl0FOLwbDrmx/tCJhLpWsjHKFJrf6xeStUbkK4=;
        b=fNu5XuoK9mjfFQiNpytyufVuD/oqvFGAilXoS86FJcxq4dQzPzz1K+upIA8Z0EGM3B
         muYGe+/r7Pn35ZjmeYKduKunISsSE1mpI4hPftQOiL3UCOa/b8ShulqqnusI4wKdnHDr
         GwraiJD49SPwzqXlZ27bbgKnFmS2qWEjHqnchAJbN2mUCNQyMGAfSx2R9/4YuaSMwVUE
         yX1VulqcZcNBmHY96suYbFD1YbzM1uskXl+fsPIGJd8gqOX8Pr/6WZbGcdiCvHTmVul6
         wOHKYPAYDv62rb7OwMcHPdqIEIGJ0s+Znd9wDu9C64jCKn2zDKXVdm3/UeifNwqFpMHC
         UlYw==
X-Gm-Message-State: AOJu0YxsaUeG/Ct9JSBF7ElgWnlAr/PjDQ36XarrSwTeZpeDcNour5uD
	o6IfhMcU0HbxEr12YS4oVhkQUg/FUJmduaPpGjkz8M3modynyhUc+Gn+Y2BrJQFm6nCP3eeV9oy
	GaRswPEllD+wxWA+Aso+7aYf0H/T38aotOIJWNpjvR+0HR7AI4Vgpu0NmNieYiyLEqKufwNk=
X-Gm-Gg: Acq92OG3fmcAOOBRrsmvtTmbBbMmoFFd3W/+0QPeQsvUPiO4bIGVcglGISvywsWujcQ
	KvPHY5bpka6/tYI996z5VyufMW4k6acpUJSs85xC/HwdVsYk5AYr6VT8phTy3id9W/5Q4GqRVxm
	aQo5A749qw1Yhz1d5FiHmfR7POXl4mXAFhxfrE2YMFcVEFMgiQn3eaPjPaVbWcS2SYrw3MADAtd
	uV2jrU+N6PbtoszZ6fw22VsknxCTPhresaI29DM6WnrTUdnZqTNagy9bNSwkXtLVA1Ww5FIYYjT
	NctqCEsSTTt3Dac/iLyKBO1SIh95dzRQITJKU18R+PJYCLFOhVhrx65mMYU926OBGF8AHUfkAG5
	xoRTEJMdxJdkiGlj0EXm2h1hvCmOMSh7X7RW+/zCzU3vR1vOGKEMThKK8Xhlk
X-Received: by 2002:a05:6a00:3cd6:b0:842:678a:a7dc with SMTP id d2e1a72fcca58-842b0e1300emr20091237b3a.2.1780983187891;
        Mon, 08 Jun 2026 22:33:07 -0700 (PDT)
X-Received: by 2002:a05:6a00:3cd6:b0:842:678a:a7dc with SMTP id d2e1a72fcca58-842b0e1300emr20091199b3a.2.1780983187393;
        Mon, 08 Jun 2026 22:33:07 -0700 (PDT)
Received: from [10.204.86.57] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828e5638sm20578107b3a.50.2026.06.08.22.33.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 22:33:07 -0700 (PDT)
Message-ID: <438318b4-68ba-47a9-8d44-a3af14376956@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 11:03:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Subject: qcom: update ADSP firmware for sm8750 platform
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cverVV4i c=1 sm=1 tr=0 ts=6a27a594 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=qC_FGOx9AAAA:8 a=KoFbm6rIk23AwMlER4cA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: jf9bGqnH-Cj0HSkNWm_EzFyMQ92OrN95
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA0OCBTYWx0ZWRfX07+grqYXjSAo
 B+5qTmt1J11U+31GFVn3rjdZyuxP2wVh34jZ4XkSTISoL/06pMNI2Ohsqz4k5B2PxeYBE4BYZ1k
 bL8EyY7KttDI3UjaPpplDKEtXJ3YaVsOSm7ki4iUhSU7HfMV/1mQQ6CAEK3Vb4UJQKersHpripO
 qp4cHPki/HO1v44hWoKLNF20LxhTRXQtsBnkvEfywP3oWu6HGjQlnDzZwvr4hSTIXP0qV5Uvf1+
 KVXM8HbIaYU1MZoHwpqaKyMWv5+Xn+P5Z+vvCpqJTNAOXb71zKIvTvAxZ1xIbQimkCQL6Xoi7IK
 m0gQ2NudCP1h96tA6U/Kcl1kt8IjkT2s0DUzwt1D7iiLP0UgfYTdWpb6eWrFr+yGd/r4L+f2c3R
 mQqXQ+OwQxx/QYXc7Zn46/MJmuI/Gw==
X-Proofpoint-GUID: jf9bGqnH-Cj0HSkNWm_EzFyMQ92OrN95
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_01,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 phishscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2605210000 definitions=main-2606090048

The following changes since commit 4ae4d61bcb180be5a9dc6a0490885b9a70c8812f:

   Merge branch 'wcn6856-fw-update-00669' into 'main' (2026-06-08 
10:47:22 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dspfw-qli-pakala

for you to fetch changes up to 72a012ee810d6a6ca4f29e13c1c300f6f364ab3a:

   qcom: update ADSP firmware for sm8750 platform (2026-06-09 10:58:59 
+0530)

----------------------------------------------------------------
Venkata Kota (1):
       qcom: update ADSP firmware for sm8750 platform

  WHENCE                   |   2 +-
  qcom/sm8750/adsp.mbn     | Bin 17639864 -> 17680824 bytes
  qcom/sm8750/adsp_dtb.mbn | Bin 167736 -> 167736 bytes
  3 files changed, 1 insertion(+), 1 deletion(-)
