Received: from smtp.kernel.org (ip-10-30-226-227.us-west-2.compute.internal [10.30.226.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6F0606A323
	for <linux-firmware@archiver.kernel.org>; Thu, 29 Oct 2026 15:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ALbGre5G;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YsNdbzaX
Received: by smtp.kernel.org (Postfix)
	id 47E8D1F01826; Thu, 29 Oct 2026 15:49:44 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793288984;
	b=hvm4gzTFZwMywt2N3bDRCTwp53IQM8m1snGnv+uL5V6hX60aYvy9Qx9yFUN0knOv4wzG
	 P0JUooTmkpSTZV/YvM/Ott0jOspe8AlE4hg/bjqEsmP1fZe1gWGLCuHbLOwGLTyAdWz9k
	 bNp1B1ec3YORIrSUEEuD7tuWPUuWuGeM1ZuYRur125kGSuJ3zBL48pwHNOePPBctaSs5g
	 5C8MBpQl7N3wuxVqNkaM0W5LYwaHxJlasTMaiPSup/ZOE581OOHKaUYataeFXh2dYKpLL
	 9EMnXPGwcJISq37OGpDlvstTzNSQtIEWsmkIsfjM0zrhHvCdkYq8gThGNDDe+CJVAkg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793288984;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Content-Language:List-Id:To:From:Subject:Autocrypt:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=q2AXkEXNvl9y1loLl9fm029qoPOH18aSZYRQB5PDC24=;
	b=iSOb9v4pYjQoV/DCClLaqIH6rk4C2sXD3twrIwas8Z9Xok7WVVMspzL5N3wkHIyNb+BX
	 9XXRKopOYDdFqNlVcuHuv2sX2zwXdKQLNT987Ziiry1bQYs/92yRs6chN+WYNscnV8b5O
	 EoKBNTIOnCMlQVkFh7uQcd6o9/kTNvB8peNrkRc9Jntf0yPhi34khRelxGNhwKCmlL1Ua
	 6dWazB4Z0LRXoGZkI3c49e7YmCJSq+TiFIxMyYFGIfWTzxXLRX4K5qIQm8f9P1S150zKA
	 srsZ352pWqjatSij03Qoj5cC04SlKLXtvAgR0QDEbXTOs2QTVuU06rmtCggb3NsYPHA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ALbGre5G;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YsNdbzaX;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 937721F01824
	for <linux-firmware@kernel.org>; Thu, 29 Oct 2026 15:49:43 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ALbGre5G;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YsNdbzaX
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 937721F01824
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TCe6KK068192
	for <linux-firmware@kernel.org>; Thu, 29 Oct 2026 15:49:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=q2AXkEXNvl9y1loLl9fm02
	9qoPOH18aSZYRQB5PDC24=; b=ALbGre5GHdSuN0EccU09g0CYOA92nxHyLggeFG
	zF/NmIVecdI3VbbsipLgj+LUZY5JY2MPUeAE0ma0ZqaTCWQPbVLS60P9SMl9lK7+
	3/SVE5hnansxFcpPXfeBnSh3hbHSyarVR+YYXWM4DuHAzBIhIWp6P3SVjEDF/rxf
	YX9Xbk3wHL9/qDpcDgkAMf8T4WgeEp1F7LA2oP/K/0ag4qQZgvJEDoVI4zfXX/p1
	Ou2frb2WUggbL+P6M4wYmyWzkXDbITdjil6WmObSATbB+ecEblRiwC1QLhWgTTJU
	lEO96dPjStupTbN/aBUTywW/t+ehS/elxdjT2dsHLsmXwcyg==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkxshtkv5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 29 Oct 2026 15:49:42 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4a7de733fa9so3136437b6e.3
        for <linux-firmware@kernel.org>; Thu, 29 Oct 2026 08:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793288982; x=1793893782; darn=kernel.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=q2AXkEXNvl9y1loLl9fm029qoPOH18aSZYRQB5PDC24=;
        b=YsNdbzaX/JHPq+8qeA4NFraCFf92i8/N3Z8Km17B87DcWALviz6zmV2+wX1G0aLMzv
         b58prWo8yYgwPSGzfWF3N9mDSlDF0G5lPgRdsEY2FG2p0aj9snPsrTbYpR5AUfvBMJv6
         rzvn7be2hTKSiSw42NFlOhUqDU+yAvMl+0qDkE6HEON5mQA+3GM7H/VcaZkt4Hiz9hry
         fB4g3I1FBPZRYXUfCmH+ptTKvODGrQXbfbNhxuB4cSQIQmiYdDhiUcWfjoG2wheiFHqA
         5ijDG/fpfEPK7XYe7d7rZ8YgHlhYx40N31q3o5e2CTunD19oS00GeMlXDflHCw6pBSeF
         vfZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793288982; x=1793893782;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q2AXkEXNvl9y1loLl9fm029qoPOH18aSZYRQB5PDC24=;
        b=D7cmlVkW7um5GC7qKGezT4ToDZK5FGvIMx+1/EwR7O9/rYoNmG+MNduJ9Mdii0Wr+p
         ELNmUdjsImyY9v7QTRUdu9cEZ85eisbn14X4BIGsKT4HKTce8O4f9UBqx2u33QM+TePD
         +bjxIzP+unnzKX+ktv2t+RnzUX5z5U1qs5iifiBObaG/sq7kH8a5r3fs+B0CJaXY6gXg
         FOGDw4ufjFrnMPKClPunl6JR8N7PYgGlYpYVqGvHKVerCN/AbzAnnE0xjNoAKOksonmw
         3tYLQXS8shBqfRSXarxN0Dah/lBIH/3NKRsqd2YHB77LyzE+Z4lmfkm5nayH5HSg7zeI
         ur1g==
X-Gm-Message-State: AFq9FYIMEmEJErQY5bSQSTjIHcowM51sof+xRz0MRyt8nKyvik8Qzq1i
	6wCOEXXuPfgZnM4o5a8wtMMk+12mx+XkrCePrraQ6PWoQWYBErjVq9gj1haWGiwq0RK1tVLCj5Z
	N5Axf8WkudHPEPl+hc/o0/GtUlO0Wz1NuDWsQK7j14fhDVbhRY3OZOYsGfFm0Hr26R4JHFNI=
X-Gm-Gg: AYBFou0T0oVIPCoUbytZ6MB7fWQCeLVwBADKNBidluGOlncQreOuW+untId4qmN7mZ2
	L93XQvhwsCAUY2X/Gbn4YERfofJOAiIliiVSsmgURxN40qf/lejXnU7C0KMbKyvcpcyq7g7xWw0
	WoCZMdSTiRZcbrj/LlnMgz+AQNdcGBut3qUhReI+HEQJP9qVQr6DfuwIDSmrfhooUIXRgOajB1e
	gLEiLw2KefTkbAnVIybrulu9gXMzCm4jsD/X4qwwJy/lLCXqQeBBL+YfC3n035eSv3ktWU+I6cw
	mFfpBH9BRNny5WFyIQLgZryIDFqmX5RpEKz2+jdZybBev5S1NSJcIPui+YPz8dezDqR7o0gH5d2
	CpKWqbdxm8dV1fnz12SkjNuW0mMCSGfD4yVG1nmpcaVbyc0cYoFvdx4CMWF5+dQC6I3NU0EULlq
	/f
X-Received: by 2002:a05:6808:1528:b0:4c4:3997:ef2f with SMTP id 5614622812f47-56382d8c021mr3784159b6e.17.1793288981720;
        Thu, 29 Oct 2026 08:49:41 -0700 (PDT)
X-Received: by 2002:a05:6808:1528:b0:4c4:3997:ef2f with SMTP id 5614622812f47-56382d8c021mr3784142b6e.17.1793288981218;
        Thu, 29 Oct 2026 08:49:41 -0700 (PDT)
Received: from [10.216.23.71] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-563c363902esm4410504b6e.2.2026.10.29.08.49.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 08:49:40 -0700 (PDT)
Message-ID: <abd5661b-cd68-4c6b-a584-d17cad2bf975@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 21:19:38 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Subject: qcom: update LPAICP firmware for shikra platform
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: eYA4XN-slxPZWpU7KajNbLvrIRRZ9aD-
X-Authority-Analysis: v=2.4 cv=H6BOUOYi c=1 sm=1 tr=0 ts=6ae36b16 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=qC_FGOx9AAAA:8 a=ey-C81fCRwqnIZps0_QA:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA2MSBTYWx0ZWRfX4hQRqSbEYfF2
 zGSbTGnx+Hh22pmP2bIb6VK4/doj2j67SzvyD/5u1IwUehQi0QjtN/5yO4EdBJefyO5ajY9z6mJ
 ctUrJ1Rfyk6XLBr2uvk3S56tOTxkK6A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA2MSBTYWx0ZWRfXxrIBI4AXHnfK
 Pohhyojk4ZD1XIN2arYdAV3vCJtwIoIhVL5p9alZYEnBwsQhcPYZb0jm07teYwG1tR8D7e4818E
 Nsto5WA6x0kjdc5+BByGaBKQhLvlFCp1EQ+XWAoLogK/NO4Geo4BWAzjJ4LJZwcQq0YOwyZz9LP
 vI5bDx/bPyr8XZvepCeZaXx3Hroi9jgzW/UBk0VlRPMvyeDt376efZxMBwy1GebWn5Uw2AzOGPE
 9E16SxRf2i4JZf53a4e/Se8Ka7tsFyyDcuNyy/hbP4+1LaJ3ePFniWkffiqKNl2WWo8DmXfhV0n
 xvU0cxAVn+8+X5UZSu0JFYGxzhO7D0oSFtCu0SXGaBLOq41tmyEuPe77Eqro/CusOJOiDz60+W5
 7uPJeGUx8NYFPxPNvQ6tGrz6JrakldWk+PTn1eXyPk8qLk6BrSMZ0QSGE4YH4wDikAUh8CoAFHh
 qNPlBrfN2UOwNG7YbsA==
X-Proofpoint-ORIG-GUID: eYA4XN-slxPZWpU7KajNbLvrIRRZ9aD-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290061
X-Spam-Status: No, score=-21.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,KHOP_DYNAMIC,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The following changes since commit bcf20866cf559c19e6f33b10266fde45013e60b6:

   Merge branch 'rubikpi3-adsp-00256.2' into 'main' (2026-10-29 13:06:16 
+0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
lmcu-qli-fw

for you to fetch changes up to 08eeed5165f667f565f920b42eb8ecc20a140782:

   qcom: update LPAICP firmware for shikra platform (2026-10-29 21:15:38 
+0530)

----------------------------------------------------------------
Venkata Kota (1):
       qcom: update LPAICP firmware for shikra platform

  WHENCE                     |   2 +-
  qcom/shikra/lpaicp.mbn     | Bin 1258435 -> 1279149 bytes
  qcom/shikra/lpaicp_dtb.mbn | Bin 39760 -> 39984 bytes
  3 files changed, 1 insertion(+), 1 deletion(-)
