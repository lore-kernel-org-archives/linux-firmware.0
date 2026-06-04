Return-Path: <SRS0=qkx/=EA=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02044CD6E4A
	for <linux-firmware@archiver.kernel.org>; Thu,  4 Jun 2026 10:06:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D25B41F00899; Thu,  4 Jun 2026 10:06:25 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1780567585;
	b=czDfZU4lqpb20AlYLLdWV9F2SZTdwLqNIlmWdQqWyZ3On8wzgHyERunCZwyjfFiHrGk9
	 lbdsep+dm6lFQm5tDtH3U+ubHIC4YGlKMYzGaJsYOHKhnZtrZoZMGz19S1Qhng4ExahFa
	 +1g9I9MI7bmpkgFLrY9liDJqUBdTAOIG7YKRUuBfPYjqe+nwhL51ZRyilowttpDtpgFxi
	 hjfABSnQk0tMZHSp8BZ+06ck6YBKxZLPTFHUjl3wKkZDehQ6atosO3eib1WyJUua8J8R9
	 jw8gOVhw6+zoccGezXBJB8UhXkFbMEkuHil84glEdEYrBH5YxjWSuAeSnAFPoezUOqQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1780567585;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Content-Language:List-Id:To:From:Subject:Autocrypt:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xE+lq1hewydmIvBTzqvn/tkilAHMzIcGUCgGkbSrCTo=;
	b=k8o5vn1SaDDYzWROarVFxmw0BAE8erzTQzuq4zJ717gttkMYENCMvL54UhxI4wQgouPq
	 qtPTbBCge0sQVg5x/PfM9tsZSy+NFPofWSSdIhwSz8jz7WsOEiMYaGQrd//S5oc68wwXi
	 l5CkqHap/bPqjyFO32MC5i2SMH0LrfTYxNWjpITUgPlYzsxGZfUByrY3B4BGZqi+hOrbA
	 dEDvo96i60an3lgKSuwVYKBS6O+kj9FOAyFJz3d3S/fhEfjQuBfh1tQs8G9NQlPWxzZ8F
	 SOZzVzytcxdgS6QLaMvkF3kthdo8ZSXCHymJUJsWraw7ie2KPZDwtULmNhR4HfFjfcQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="YN/2ejjv";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C7HK9i8g;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 29E901F00893
	for <linux-firmware@kernel.org>; Thu,  4 Jun 2026 10:06:24 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YN/2ejjv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C7HK9i8g
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 29E901F00893
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6548Ak0l140442
	for <linux-firmware@kernel.org>; Thu, 4 Jun 2026 10:06:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=xE+lq1hewydmIvBTzqvn/t
	kilAHMzIcGUCgGkbSrCTo=; b=YN/2ejjv0MRaxLbINdYsU65Ca7mgLn0iT//Aew
	wD/+dBQCAw77ZNE6tEWM6lTHC85Jp3Qs/tqg8Rab7twPDqYwi6zmM/COJdH9pVct
	to0nH9OCpJgqqCKHmnbFF6Y6OvByKpDx64qO5040g7JCgMrTF492nC0SlZS8vDBi
	7GhH4i48u3HFiV9WRsnTXe5Ei4hIIKqUf4O8LYlZZ0jZ4nXPRXI97PeyRCXH+3zL
	1JNSY0YGQXw3SOTL4koDG5PGQXtOHj2X97DvnGl8jjjfgKR0+9y2noTXQs+tF0LX
	NmWCHqrnWXxhXKw3uoPx/qQyGIDiHyWrTrMUqaItTdl3oHlw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejyen9s3a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 04 Jun 2026 10:06:23 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-842688fa7b8so1435430b3a.0
        for <linux-firmware@kernel.org>; Thu, 04 Jun 2026 03:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780567583; x=1781172383; darn=kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xE+lq1hewydmIvBTzqvn/tkilAHMzIcGUCgGkbSrCTo=;
        b=C7HK9i8g+Gja1jjosysHq6c7i+EJVLup95t7ETtVBkRJSIdlhjlDbA3OcjpLlbJb2L
         G3hEZcfKiNQqz1h1fJO90gi0TCxWq4f7u/lf8b3DMTlBhDAYZ9fPYM2w+pKXFbMPvQzz
         LlEu7pDxHSA278BI7v9gP1WipUnh3tfyDeE7ng0nXp0vNk18y5A1a7vl9dqa1+wppvsH
         2tZRCdhmKmkQwvsoLX4V2ax+GPMaO/XYo46UZLg9bGw+gJ9dGiN/UvESWZIhywy6jRNB
         32sO2+FdouJBc1IrNWbrPoKe1MGNFhD/FeS9fmbDiGv5k40MznI8TivHCG8/nFXxh73q
         6GUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780567583; x=1781172383;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xE+lq1hewydmIvBTzqvn/tkilAHMzIcGUCgGkbSrCTo=;
        b=b3ECwUFMec9UUbokCjl42VrNKkfLqVCd1qjC6jgWpy0+2QrT/3JFR2svkpSXUy6mWL
         hKSpph1T5D/wkygXvPA5YJjeHLqQk2a/gwy/3M8bKsGWznnJpTUop8CWpVgX4+gR6IVd
         K747paTWdZOQm/YSppvit01Uh1pGXlQPc7RMu3I7/iq5tFvPBo7oXJxMKpFAg1/B/5OV
         z50fLLICeSEay3UALq6PSn2bMzFcLDdXcjBiEY7YBNKVlvLCu05cj1OFDM2vy48up6Sg
         TJmp20gmHl6ekC/VCx7LKLrqzkV0Xq3s4zAwW1+bH+OXxHl2UmPzm+LzVXrhk/YJ6inZ
         3zfA==
X-Gm-Message-State: AOJu0Yw7O+uKT2CyCGTlq9p/OhharWrpx7JTrExCH0LUccy9Rjz/AfYq
	hqGX6214UYmiQRbHEkkGvrwkmlNUGQ8Io1sJnDZXXP4YkfA8m3brh/5wg9gsLOm4MAGIcZuLoRX
	Y+4FbCpOF31xpiYu5UnJ1uZUT2jx8Q9kKpZ0bGUKNuKkLEmjxhgVnSOI76Ujmfh4cVm0uUn4=
X-Gm-Gg: Acq92OFX+SUjLdB66+pE6Sg0ai2cllr+8L/dXRMnRn3mnIAsaUzqCKF2JvgYHMHyVzX
	d8Oi5dqMlQaOqKZ8PqQYPAfTgJodEjc94/sETmmzdyBsRXJiey5HMVrylQckqIBBLAKVULgfH3O
	GJ8h/ZpFMkBgLvBLC2mAC/FB9qQPVjjzCKa8VzFMhrSVOXS1q3G2N46j4xGKy1tJdYYryGOc46m
	ukvSB8QjSWc4Tkc8oQRFOScFj/lkNWTGN7oyqCmhl472xIEa9NBnpRMDw/IsFVPCAQkqJc4fWzr
	hKiaH/ZrlVY/25dCs2Kj+S1phU29yCEWhSbDPhdFRhFIVpJZTIbF5Hi1SXa8Nt/hom1Ud0SKd9I
	g0GR3q/96UuPr8Qz6OUQInpXE7RLYCDWQTXKZ7wewxPG/JZRBY1eWO522Dtif4w==
X-Received: by 2002:a05:6a00:9513:b0:83f:250d:5a5 with SMTP id d2e1a72fcca58-8429b6ab7c1mr2708523b3a.16.1780567582945;
        Thu, 04 Jun 2026 03:06:22 -0700 (PDT)
X-Received: by 2002:a05:6a00:9513:b0:83f:250d:5a5 with SMTP id d2e1a72fcca58-8429b6ab7c1mr2708504b3a.16.1780567582449;
        Thu, 04 Jun 2026 03:06:22 -0700 (PDT)
Received: from [10.204.86.159] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428706fa9asm4996192b3a.45.2026.06.04.03.06.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 03:06:22 -0700 (PDT)
Message-ID: <f3a6a44a-43c5-4c99-9e39-9b0f0a91ebaf@oss.qualcomm.com>
Date: Thu, 4 Jun 2026 15:36:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Subject: qcom: update CDSP firmware for x1e80100 platform
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JaSMa0KV c=1 sm=1 tr=0 ts=6a214e1f cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=qC_FGOx9AAAA:8 a=qBBv3P8nucFailthiGIA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: DQxsL54tzNKMZARbyCNzCh7KdfhlYTD5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA5NiBTYWx0ZWRfX/vjBAUBScUZ5
 ZWRVI8XSYMoBL+4qgIGKtJuCTsMsfPw+SL8wkSns3j56yFyMwuwDTrBzS6Wr5LSu3nCdmrlV3Ng
 TB+/j0PS9+vtHVgggix00LfDHB4gtmoldzz/Dz9EDsG42p27H6XXLra7Abzy3SyEEeq3i8HKiW6
 KBVeafDHBhNkm9EA7C0o3wXCPz+KHjOSxvlIcHA/2uHhKjhW6D6dmMBIUkMwtF0h1Q15GqbZrMD
 eH+l/WK8XK1/HSWX+dBeUj66DFDSmot4MfmC38d4lsgQBKppJEX82l+vpddYT4/j3OUx+RiRWYx
 N0NUIbSKyL4tPYS2S0FItlTjJ4oEd/HOm+2YPCYCaQLnXFPJKRWpwv7yWMWB9RI/Ew3RW7sLcd8
 ZMZNXgeweYbh8i5x8VpNVbmqNo644J9VNmwhdUe3J5ZfD+mxahyT7qb7Of1g2vviqYOmiOLwoeD
 yVuN76tgNQUY6qGSDEg==
X-Proofpoint-GUID: DQxsL54tzNKMZARbyCNzCh7KdfhlYTD5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040096

The following changes since commit d953ad875636676424a622ab91cab51b97a0f50c:

   Merge branch 'orn-btfw-1.1.0' into 'main' (2026-05-29 11:11:05 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dspfw-cdsp-hamoa

for you to fetch changes up to 9051fa1b753accf241d00f049e131d8f9f918dcb:

   qcom: update CDSP firmware for x1e80100 platform (2026-06-04 15:32:12 
+0530)

----------------------------------------------------------------
Venkata Kota (1):
       qcom: update CDSP firmware for x1e80100 platform

  WHENCE                     |   2 +-
  qcom/x1e80100/cdsp.mbn     | Bin 3215784 -> 3215784 bytes
  qcom/x1e80100/cdsp_dtb.mbn | Bin 40760 -> 40760 bytes
  3 files changed, 1 insertion(+), 1 deletion(-)
