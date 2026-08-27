Return-Path: <SRS0=s1Ma=GU=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D70BEC5DF9D
	for <linux-firmware@archiver.kernel.org>; Thu, 27 Aug 2026 08:35:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9DF8C1F00A3A; Thu, 27 Aug 2026 08:35:33 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1787819733;
	b=O6e2K4lf+hLreZy8LXOBIDmuNOE+OeYzYQxVvLYH7z/Q+UDnOtIszsFj5OdtuD0KSbeu
	 7dmLHxxFMDvOWxNJJyBpP16anLFD4t44SjrH6ySPFyi7MSZiK9RwinNCRlrCbI++VImNP
	 sdnONdWJ0rdXQVYilD0tKKP34084LdP1K1RqsZBzj1s1INJJxH/x9lnv7TdoW4TfzFDSo
	 WHGmGgoAdgXDJzCpCYKQa0NcvxbWHVZncJHylxMUk5wWapsaJBJ9+/WneWxEQwGfNIFUy
	 28GJvBd+kuGkZKc6dkUAQT1VsLIDqu5ceX+C3DIAUnBsc/RNaHBUPXZ7JowcX+bMBTA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1787819733;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:List-Id:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pqsxQBbjDoRvGx0ThyNcc+hW3u7PDXxAjCmHwO4hHeM=;
	b=YAtTITJtT4zkLOvzl461FPkRShl2XOFvYdSfmsRSXcNimigww2ofTFIx2vn15y06/bQ1
	 iyH5RuPKLYMjcCoTnNnX9UHp2G9tb9uOtma/kRCTdkEyFWt75k8yshSRInc3aN7I78JsP
	 P2itae86NAhUxwn+4DDLv3heuPvgh1rXjBLa7ivXpGJ2yXosVr42CbD+tjwbTvhMQEhRk
	 eSullYA5rwUbkf+5bucJ9fmx4K3ak7q3t2TU+JpHvxS/b13vGNh5tX1X8w567/QYl/eBR
	 N5ScA9r7PYvTMhhjp5dnR21pDgal3z8Qin216E1SKA97aIoCsi7I3m9TchX8BoXGThQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g8wNAsML;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="IU+/LVdk";
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 00F561F000E9
	for <linux-firmware@kernel.org>; Thu, 27 Aug 2026 08:35:32 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g8wNAsML;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IU+/LVdk
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 00F561F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67R6RG91088070
	for <linux-firmware@kernel.org>; Thu, 27 Aug 2026 08:35:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pqsxQBbjDoRvGx0ThyNcc+hW3u7PDXxAjCmHwO4hHeM=; b=g8wNAsML9SuUB3+z
	BjULwIePAW7X80BdL0T2DqGWfsqPLl41QvVpDuRkSxM2AiYRr46eroZP29kETZAq
	lYoAksUN7dggKifgCF7Yvaf7RwCggLMBi49xa6W1V4nMH0q2y1QQ5TfaV2ZtOoir
	7kWyY/FPFe8FZLoMkE1Vi13Ne7b6+0S2ZShAQehTG/YF3Wa03q7N9CnKNCrVKnmT
	EJozOuCZx+10gqc88rEDcjwD0vtQkP43y07dl1FYia2i8egnWaAY0F3fR4X5i1GA
	YOcDq1wP6I3L6yUgkDwVK78ulWHILdU+8Inpfzl+y+VxH20UhTZDv4BMJcTFRSLx
	pgUzdw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga8m5hum9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 27 Aug 2026 08:35:32 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3965ba1ba3eso657897a91.2
        for <linux-firmware@kernel.org>; Thu, 27 Aug 2026 01:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787819731; x=1788424531; darn=kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pqsxQBbjDoRvGx0ThyNcc+hW3u7PDXxAjCmHwO4hHeM=;
        b=IU+/LVdkT1v4tCekA4wE5l8ZC1SofUl6Qv691Zmdew9+/dQUoefgvdzKfi9+u1YY73
         yCw4eZQMyicAq2pBYgKnz0Aomy7OEfGvmOxQwFvLv7TxnmAM74FDQzhCY0048n4vPvbI
         OY89QdKtRIl/6dXyfOmnASY4lVu5GEfDCkWZsH56e7q7KD7+Vzziym0IVw9ZzWL17YRG
         Jkyef1fSchM8LzSTeDT2IvX1lYxq8RMoWZQCr2xNglejxPfdnPmUZAMjZzfUX9+DfKqI
         6vfNCQgAsouNbYtxxJtRGEO6bZ84Su95/RwiBERugU+3XstFjRhAoT/EqB9UqHzpm6h+
         p8VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787819731; x=1788424531;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pqsxQBbjDoRvGx0ThyNcc+hW3u7PDXxAjCmHwO4hHeM=;
        b=U2FRlXp3HbX/Eb+CJwJanKVmxxnc8j/3ZGt+pSe/5UL5y4/q9q8G3ECFddQLuh91xF
         ElpEh19AGjMDtjjZslXlSR47U0s9Z4YOAc56uVBnpRnzZloU6qxzGUlYMWOHxm5BD0HY
         L0nWZYpgY4iPpoRwQd/OczP8lAqpvOu7Q+YeaZD+wMs1TJeLWH3Pl/dYbpJyOZEQ0FVc
         0NaK/DpumZ+xiV8o7nd6s956TnVZs9CHUmI3fx8XrwIAjjr0397qQwfhtrShlvpl2GSd
         wcD95/Ts1tTdmSUCoRbMHwSLsC/RiFa8S1RA0z/9QmnZMYBj7uo0oqVc+KJl5z/q6+1u
         +Hmg==
X-Forwarded-Encrypted: i=1; AHgh+Rpfy5bNH7KurLFSuVsz1pMjd9uJmTFFqYsXG215SiO3I8KtHA+FGN1ufxtyTUVhqk6Ou33oR0w/IrXcssGzXA==@kernel.org
X-Gm-Message-State: AFuF++lTOUx8sq/OIhc/77dU3h+U47reKQyy8j/P99zMhNQHSNL+bpT1
	CyHTMnvZvKLjUF2AZeH4bQOl2fK5THELOy3QfowZ9HjXpH2ugDxl1hstYuQIRsUYU0Vu6NVUk9Q
	pDjtWvdaEG4Lf/P7T3z64NEpvFmQqRMk5kBfAXz+usIXWaaHebXPkC2vBFtY8bqTF4XU2pEg=
X-Gm-Gg: AR+sD12AUZeH03jOIbtV7+cYCqPnUzjfOmza7VNIQbjGOaYhbjWSVv/IXj4nV3Y+pL/
	gyyGLQNtSOmcPn7x/j9X6LCw7P5hckoFbXOJoQAq2JxyidII4VKjbZdpBeVS4AbrJep7qoBhG1k
	vuirQlNw8mVPKvD4x57/KdRmpNdSrnzg6U6lYYhEDTqvVe7wdI3K7LNkBsFNL4Oh/fKKqhFW76X
	pmZgtSj/fH4xXR/DeumwAb5ADvPaCfL10Vds+MycLpglNU+P7F6XFzQQ7R8ks8RgDytj9fHijbk
	OwOR+ZmkX41W+BIWijth/VGkwo09vjRvrshdfx/RKlBWALUL4JJRS1WTzpipqquF3A697Cls3An
	Fe1/IiYQk6qu7hE04N0oRYy62R3xo
X-Received: by 2002:a17:90b:3890:b0:395:bbfe:fc6f with SMTP id 98e67ed59e1d1-3966d401db6mr26108833a91.3.1787819731283;
        Thu, 27 Aug 2026 01:35:31 -0700 (PDT)
X-Received: by 2002:a17:90b:3890:b0:395:bbfe:fc6f with SMTP id 98e67ed59e1d1-3966d401db6mr26108746a91.3.1787819730787;
        Thu, 27 Aug 2026 01:35:30 -0700 (PDT)
Received: from [10.219.57.13] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d8c4e56sm14918512eec.22.2026.08.27.01.35.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 01:35:30 -0700 (PDT)
Message-ID: <d6092852-a53d-414a-a5a0-3dc0a96b170e@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 14:05:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: add HPASS firmware for nord platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Saddam Patan <saddam.patan@oss.qualcomm.com>, linux-firmware@kernel.org
References: <9198246c-7518-4c3a-b163-8b3ecc6292c2@oss.qualcomm.com>
 <t433xct7ravyod3y3cynlt4s7qkjha54732yvsguia3a3j4ncn@jgpyp3smfwmp>
 <18b58b9a-2fdf-40f4-96e0-fa732c5fbe4c@oss.qualcomm.com>
 <wtwyj7badkcgi4bkxgdqtknj5mvhsdawglnktflxbdfxxinr2h@rhfylwng3pcf>
Content-Language: en-US
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
In-Reply-To: <wtwyj7badkcgi4bkxgdqtknj5mvhsdawglnktflxbdfxxinr2h@rhfylwng3pcf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: TAk4soi7yfn0Sa1Ik62NYkxHLJk0hEdx
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDA3MCBTYWx0ZWRfX8iKEFLMQrjzD
 qApNHWSSoHOQJK0+fXdp4noHQkNsKYYWWOVqyt3YBaKAarjUt0Vi9fy+TRXLzgLA8v9fccgWB2Z
 BHoWVjA19n2oHnWgHOXtG/5TjhmqmMk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDA3MCBTYWx0ZWRfXzKJHI5iQ3i1D
 aK4lkM/qETQ259fRcq2fZMi4/owFcN7ogUfikljAHAXIJrgxE4nvW/xjcsaalfo68nKMxexaR8N
 xqAMJaIrWB2go4sb2yVuJxZYf/oxozBw/z+NYZmzUMeK2l4WDZbaJNMYyiefluPg3Zi3YXm5QHC
 bqJ4gP2kKY8teFi/MVXx4nU/z3q4MaMNIQdmHCQoklFlquTqkKbrsYhG6hDN+M1sK62nL7ztnED
 91clVW/2MgJL7ZP19P7KL4s1Mk/bizEmmr6T//Rj8uqD08K2QHqXxl+RZtYHkh7yv52Nl5Mb4uB
 8xEZEWArNil8Nw0NHsvhnlOSml/ZJtivsjzvLVEI1Dbe/Jmet63ahFUiRTctrhvCTjx2gLmhnsg
 OF2fX6TMLCiI6qcJvEZwI+gpayvDx6vNqcFYbHzrg80dnZDH2xy2s5yLeQxNTN1PuVHoEY7eSuS
 Iv/47fiU3xmdOcmw88g==
X-Proofpoint-GUID: TAk4soi7yfn0Sa1Ik62NYkxHLJk0hEdx
X-Authority-Analysis: v=2.4 cv=SomgLvO0 c=1 sm=1 tr=0 ts=6a8ff6d4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=qC_FGOx9AAAA:8 a=kNQFqHN39lb9Knwk7AYA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270070



On 8/26/2026 9:00 PM, Dmitry Baryshkov wrote:
> On Wed, Aug 26, 2026 at 07:15:54PM +0530, Venkata Kota wrote:
>>
>>
>> On 8/26/2026 6:17 PM, Dmitry Baryshkov wrote:
>>> On Wed, Aug 26, 2026 at 12:26:38PM +0530, Saddam Patan wrote:
>>>> The following changes since commit 01205307636157a12c29e6a774bf83b218732050:
>>>>
>>>>     Merge branch 'sa8775p-fix-sig' into 'main' (2026-08-25 22:03:45 +0000)
>>>>
>>>> are available in the Git repository at:
>>>>
>>>>     https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>>>> dsp-fw-nordhpass1
>>>
>>> What is the difference between ADSP1 and ADSP2? Do they need to have
>>> different binary content?
>> They are different binaries as they are not bit exact. There are few
>> register configurations that were programmed different from the coretech
>> side. Not sure what the history is with that. We are just pushing initial fw
>> based on a CS sample of NORD Auto code. There is no new change planned on
>> the same for now unless there are functional fixes needed.
> 
> We already have the DTB, describing the DSP (see adspN_dtb.mbn). How
> difficult would it be to move all the differences to be DTB-determined?
> 
> Consider having a single image for two logically same units to be a
> requested functional fix.
There is a Feature Request to the core team to work on this. There is a 
significant delta in the split bins as well at this point. Looks like 
there are significant changes that have made in during the Nord Auto 
Program. We shall keep working with the team and once fixed, we would 
roll back adsp2. Right now they are different.
> 
>>>
>>>> for you to fetch changes up to fba487041d4194d30fb599b04285ad9cd766f281:
>>>>
>>>>     qcom: add HPASS firmware for nord platform (2026-08-26 12:19:47 +0530)
>>>
>>
> 

