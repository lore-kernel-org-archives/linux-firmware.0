Return-Path: <SRS0=v5zq=H7=oss.qualcomm.com=saddam.patan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5B1ECA6015
	for <linux-firmware@archiver.kernel.org>; Fri,  9 Oct 2026 05:49:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id ADF881F00898; Fri,  9 Oct 2026 05:49:37 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1791524977;
	b=r47teBdlgpgzX9wM7FYIgqsrp6sueAiv5+VdVjK9homvsNbOULhA6i8o+FQMEvIvQFtu
	 97aW+7OdhQHS1q2HbBqIlBesrqmp7kkQ0gfKL8gDuDtyz2XwihaAkcD568WWOsMSEGbtP
	 tKSuHQSNv83lcMsIwe2QNvUj7Uaee02Ha+zZLsrdLUOHum18+gIeZ9BZU2X3CUZROyLEB
	 LejyvuytzTBgTxDfjmPHJldT6T45jblt2xQ5vmyIZyXNgYk8IYQTfFJFI9VNFaCIjITWc
	 59y5G4gmhrizyJPIcfdh/HB//0xKpIfKcV4CZCzWKCpKDkPnsBds6SIaxl/KGwyDM4g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791524977;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:List-Id:Cc:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=9CR4vs05BcRaRlu4weA1oFNMQeuI1FPXXPq0sIHndAE=;
	b=k0X0029eg2m++o/MLHHSs3/N0mpO2oC8cONhJlk8+E+GREaHIC6Z72vD6nL6XDzhiIv8
	 E8ytbOzy6yyEH1IdyCNSVcTvXQdWFXE1RWOsmcTQUkZyQH6PGreHGw5d8+zb/bDv6O7VT
	 a6gSlUr/UaVOhBozg3v6x7rRKijlx8nmvTSe+AdLwS9RBciKn2szxG+zGEKN1ePGcGsJA
	 ofuG5AkTqSr2Ki766OBS/wH2o2unWOPUa3abmf4350285YU2UYNvfBRtB3S2Gp30Ba98/
	 W+9O+/JpikfiJM1PGriZG+gm3Au8AZS/TXgca+t/rfIwpvGp1xpYoXmSP+FunQCyFBg==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LRN3RHRM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HezuX1bc;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 136631F000FF
	for <linux-firmware@kernel.org>; Fri,  9 Oct 2026 05:49:36 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LRN3RHRM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HezuX1bc
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 136631F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HKUh4178448
	for <linux-firmware@kernel.org>; Fri, 9 Oct 2026 05:49:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9CR4vs05BcRaRlu4weA1oFNMQeuI1FPXXPq0sIHndAE=; b=LRN3RHRMPP8GiPXF
	n3V7A2hHHtLUM72aKdp81jEU9aAc8TIEPiCGHrYjbiXFOzvf/7fq/v4aKG5Qfpyw
	v3JNEuQu5K+Rs0AH+KOwiB4recBxIpAv8ph6f6UY6igUyN6JO9fd9Pv2UxCYLJCL
	m/Ca+Ym90MheM3wt6On6sVrf2R8Z3Cyt0uwyuDJ/zhf/sv6yvjSpTwEQf2z1cS2A
	JM1Z0PQXHfwim1yQOXO1hnuwk6YMig2ZxXmI78ACbmvkvLStgJvtP6+rcgTcfiJt
	e6JU+xDYZ5eApsVVdkGNiUiFIZoKRuTKutfXBwxg91PSc9yKmMkxd2kQWaUoTifK
	wGXZ4w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxrt4rd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 09 Oct 2026 05:49:36 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ab341816f6so560269a91.1
        for <linux-firmware@kernel.org>; Thu, 08 Oct 2026 22:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791524975; x=1792129775; darn=kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9CR4vs05BcRaRlu4weA1oFNMQeuI1FPXXPq0sIHndAE=;
        b=HezuX1bcYCWvAUSuN/A3p3G4AiXvrVATyFRyyX2UAJEhYSscScawpUQ4NrnhUbGJpF
         oIFOw4vhQhuTepiQyJX2UTknChaVKYYsPKZpyLpE3ha3wSBUdeO5btj5xA4zdTPA9VJS
         /DClM0apnD6ilJ7ZpLlmbGYodkkTIebBKZTwlYS3wtk2dUy6eC5JryxLg2vJzSvi8hlO
         nh/x8xXp4c3LocKUW9Ij4rxI8kF2sSx0vjsI7XQB9oD8zBMx/201J75bDqm1GfwkDtS7
         TwMMPIYcZCEm8mjUw1KPRaBR/yVyByX0uMgvwsZ8+EReQ9udbL4IhF1H4iCPC2TsyiO1
         8/3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791524975; x=1792129775;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9CR4vs05BcRaRlu4weA1oFNMQeuI1FPXXPq0sIHndAE=;
        b=GYIo77DsEQffiYPvVE6sHY0NVgHFYjVMcDUWqd0o+JTivFUlpxoG5YFd4zQZ1+ddqa
         PrOQG4g7RXicM+tfQwSASh/8rHbbYaUMT99d15hNXPU2vApSyD3cyk2QMqJOK5zgKEpk
         aCucJygW5JAHwjYv72T86pZytBj/eUMO51MDoQAbMYWdZFOd6dywOZAewLycQpzFGtVS
         OccwlRyPjaHS1NJw5J1SSl7RWzOjTjaS/ljl/Jw6ja7FfMzawObru4AV/dluAUR1Xyxq
         GvSplclT+c2bvtNnDjsb+TTQCK2KIVnVxTEZiubdU00z+SRP5U+Uc6t+JvVEVpgGG/3L
         tLcw==
X-Gm-Message-State: AFq9FYIFltvYtQbXRtXMeWYDt3H3HGkycE16AmqfBjxx4FKpDNW5i05l
	lnYAoXFwx/5k4aghC037FOziH8g4v51oVg9eQdXYVks9sOXy54GKIl9szybuqVOvntmidIcd2K1
	O3F+mulmpao0l02fMIPTfW2pi3NHVtGF6/V9ICbJZZfn+fubgmAwsx3rmiHWuZK0=
X-Gm-Gg: AYBFou0gZu7KE5OX6i9i6lKNYO8ldv07yUSSiNem1qK0JBjv2+/c8BahkNZbM48xrtJ
	7TeXQBBll4XfR59fbLEyFokNAhLnrrmQEebmEFmty+fJCPb0FFQKwMBP6olwuOhwDtpSIK2XKDw
	gDEQYdwrfiG1MWPtPud/zzuebdlL0cCRSytW7zN0nl6Qt0fMJ/Fm5/WFLt8rlY1d293MW2wlq54
	TBuXzJKPvcUT2hI/vKD/ScS7nxlplWlN+LG8H1hpo6tvKg47vrPr01fr5H72iWwRKlGPtAdjjk2
	NQoaSiN3C1eoECIzb42nicALHiCIB8+TCPaKBG+/Nxw+2P5YZJLV/9IEF77a0VPpB7O0nKflvjS
	IeLLs7/n6jNBkFZquTtiBOtMplvU=
X-Received: by 2002:a17:90a:6c8f:b0:3ab:3e1c:3c33 with SMTP id 98e67ed59e1d1-3ab3e1c3d87mr404464a91.36.1791524975457;
        Thu, 08 Oct 2026 22:49:35 -0700 (PDT)
X-Received: by 2002:a17:90a:6c8f:b0:3ab:3e1c:3c33 with SMTP id 98e67ed59e1d1-3ab3e1c3d87mr404457a91.36.1791524974904;
        Thu, 08 Oct 2026 22:49:34 -0700 (PDT)
Received: from [10.92.209.29] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab371b2f2bsm1893386a91.15.2026.10.08.22.49.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 22:49:34 -0700 (PDT)
Message-ID: <d281437d-96a8-415d-95e5-ffe837cd4a0c@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 11:19:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: update HPASS firmware for nord platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, venkata.kota@oss.qualcomm.com
References: <c67f14a6-502c-408b-8f5a-14bd703d078d@oss.qualcomm.com>
 <bogjreespb7ntadbtdl5yhbhqkfbmi7edd267pr22r3depgbjq@tth5ymlascdr>
Content-Language: en-US
From: Saddam Patan <saddam.patan@oss.qualcomm.com>
In-Reply-To: <bogjreespb7ntadbtdl5yhbhqkfbmi7edd267pr22r3depgbjq@tth5ymlascdr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=E+1YNqdl c=1 sm=1 tr=0 ts=6ac88070 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=qC_FGOx9AAAA:8 a=f28FJyRPL2d07ICro5sA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: w3jDiPNuxiHHt_J6Eyy7RvCN_ymRqeRC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAyMiBTYWx0ZWRfX7hIoZCUxpwQe
 fROP6OsKOJuVKAswHZTp/4u+z/cUSXxB0bxTnIqQ6KFAt4IFEWNdBlyOwN+vBZMbyLAoBv0dX0w
 UW1E42vcEVxWMCxAuv1Le/p/jjsSCsQihe8cfmntQR8gAQdwWDdELxahRoOoGAJAfEJ2bKOvgL5
 AOBIhKzW2ZMDfkAPxxVLpN6g0lCH6qoWERg2dTXiMz4KElGJnvLdfWp5sYQocbl+Hx1ONTcVIez
 cN1vohuk0Glu/nAlA5QznzcK2gjFze2nlDoRsNl1t7LwNtIb2NRa8LCrg8TLIGcmcClM0uddcDQ
 xsT3q94eVOXU8EIoSwEE42bkOHo9EhjQThZyKU3zbyW6d4XXrytRy1z4f6nSnat9E3WkY9kLyrZ
 OlNiM6EzkWiAcJccrRpSYAVRuK5ZXVoFXq1ALBj+tdoV50f1e4cS/5qyl9Pjoi0mkPFKfUp8LA3
 tnXPbAuUW82iXJezwhA==
X-Proofpoint-ORIG-GUID: w3jDiPNuxiHHt_J6Eyy7RvCN_ymRqeRC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAyMiBTYWx0ZWRfX8GIn/wz997si
 ktKCygZONHzovRiRM8ifg29GyHyG+vLxvyL00hwBdi8idjCtBOXQZcWW6CRsipst8oXhXo/199P
 trVvsdp8LF3cI6RvoHQxaPCQIrIQZBE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090022



On 10/9/2026 3:27 AM, Dmitry Baryshkov wrote:
> On Thu, Oct 08, 2026 at 07:50:36PM +0530, Saddam Patan wrote:
>> The following changes since commit 24247053afda2bab6b4ace42402dbf9f3b1305d6:
>>
>>    Merge branch 'arch14-8' into 'main' (2026-10-07 12:01:52 +0000)
>>
>> are available in the Git repository at:
>>
>>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>> dsp-fw-hpasslatest
> 
> fatal: couldn't find remote ref dsp-fw-hpasslat

dsp-fw-hpasslatest is the remote ref name
> 
> 
>>
>> for you to fetch changes up to 898bcf4ac1e4dbaf40ffebe12d56890c4e2ea856:
>>
>>    qcom: update HPASS firmware for nord platform (2026-10-08 19:47:08 +0530)
> 

