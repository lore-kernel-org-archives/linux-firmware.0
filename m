Return-Path: <SRS0=dr8J=ED=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5B1BCD8C8C
	for <linux-firmware@archiver.kernel.org>; Sun,  7 Jun 2026 17:26:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AAF031F00898; Sun,  7 Jun 2026 17:26:39 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1780853199;
	b=LvvHnnjcy7jGHk7NWmy6zysznsSaeuSMseuSKAQ+lGE4gm/cXDaryB1i9qcu+bydbkZ4
	 ZrgGHRCmOt9WUkUM2cciLoujfK1qGToLTJ2hiJ5Y7sR834w684ak7M0p44A3+3mcjGaP1
	 4Om1UkrPSnz1hsIom50TVkxg5HNIXycRXu/bzFqa8tQeC08ZOeddaTOsivLNxiha6w3tb
	 ZvkaoaAAlRaDDZIEexBtu5JtolMBB2zYY/tfWJ7e6PXSxEBtRO69i1JHU+4agwKiQOwbN
	 Vhask54UuEYFQ6dHxwV7++XavHag/58YkwPU/eBUYJ8o+F72tTFrRIUrySNu8j3vbZg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1780853199;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:List-Id:Cc:References:Content-Language:From:
	 Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yaOoxJnnQpyzRVzdVVFmVmBopxo1KXyBPPXeAOyl13U=;
	b=tiypce47+kX6VHy7eBgP5yypz1jA7uIZYUt9OlvUh6ebbQ9lcHfPauX8TnXMWoj3Wf+4
	 RboRi7Zw0uK3n6+L++811uVuWyT4O2kmOpeic/+cSnv7IGZVHGpjcfbciSsc6vUIBnJ+i
	 WNsLSTMd4WVGrro7LM/AM9YY2n+Q/BDhPOa4Bvt53UPbVx52jU2EJs4F5LMWvQwYqxCcQ
	 lKjMI7PsfLkrGHy7H2pb6IMkcMyk0kTmc5Cv0pnYNRHvK2Md5vD1gtoCww/ooHVn7F1PQ
	 wGR5CYSPSf92VlffejW8upCateVoLhhHhs+a+G3F1O1Vjmq2Pb3V/8DRETEUSmWOgFg==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FvRnJKXd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Oo7hZT66;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 07AE31F00893
	for <linux-firmware@kernel.org>; Sun,  7 Jun 2026 17:26:38 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FvRnJKXd;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Oo7hZT66
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 07AE31F00893
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657EmGMC828826
	for <linux-firmware@kernel.org>; Sun, 7 Jun 2026 17:26:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yaOoxJnnQpyzRVzdVVFmVmBopxo1KXyBPPXeAOyl13U=; b=FvRnJKXd9wfyRT4z
	glLhLegTmp+DjMFV0b4qrGkqTE9kkPUAXOaTarDlWMEzo9gkhyvP0riYbZRuAlBr
	QO5bEXcgEffbOcnsY/dMaRs78HnEp/ZwevlW5jjqZ5yKIhRcLt74g83z7eJj5Jzd
	GueFJ1LpohnKnD4PWt850LBZnRhikvl4sk74M4mwu8D52S6nIHc5eOyJd1v3SHrJ
	qMh/bCNv2na0HjCVzbtxQnWA4NeYHZ+QlL59z1qJK9AAgcHl/IQ8JfEW4JICte2y
	bVuLQmCrJHYpNOXPbMRxP1uyyEE5EmLCmkQgoNQyigO0yOwI2pYSR6p3XnTaCtE/
	it+S9w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embx6ca2x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Sun, 07 Jun 2026 17:26:37 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0c20f7581so37977705ad.0
        for <linux-firmware@kernel.org>; Sun, 07 Jun 2026 10:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780853197; x=1781457997; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yaOoxJnnQpyzRVzdVVFmVmBopxo1KXyBPPXeAOyl13U=;
        b=Oo7hZT66NR9XBFzTdAJISmc3OytquSyQHeKIKJz+k3d+rDvB11SyZm8GNvGEc9FGrU
         xXroK4ACxajomO3OcnnSd7JcR1XX4B6/YhSik8sI81Fa4UhN+okYPow9kAj4J2yZQJH3
         qP0f6UY6AedhxzmBo34ae3mpQhkmhR3mU8dD2E2XJfcIc4oJnNq0hJswaK2UXzjASEhz
         ueiFRqm9sv4xzkGAgpwh8bL9GrGrOEwNzNLEuMtDoaZjwBgHaW/bcRYgFnBvAqBkLTZx
         rcMifroXLhCw1K9zSgUUrs10KWBraQG2QmDlLcThNTu5GFHUPTu+Oe+I1WJkugGmIC11
         G4vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780853197; x=1781457997;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yaOoxJnnQpyzRVzdVVFmVmBopxo1KXyBPPXeAOyl13U=;
        b=TTQuLfiywOzdDak9IC1R0TpMKGWEuz+X/SI2E8yZpn0iUlT+qqWpnitAI2KpdcLxbZ
         MN0SBF1MxEfrmr80RLkYMFvq/PcMoOv+ZrcNdDtQhFj4wyWDqRnBXr/2wgXBGdsv0GMQ
         Y6YKakTJMWzTXpipazo6QGw1RUsjpJULGF/doxAP+yK+aPqPqRzUX5RGDO6ykVI8YYE3
         MdtJsu2QB7b3AErxMW4MK4JBExwPaDAVtpnoc8Sg1fVSKJFCxuHfWglY0coaXZEHimHi
         n9pu33fmr+MSw6+kTjmQdepE4NpHfg9nUhz+K+sL9YOzXTTB8c/mgn9SWuhXlAEtxoDu
         +URg==
X-Gm-Message-State: AOJu0YwjS5HttQpr3Di7+wokuRK4xwTeHE+nCeWQk1E1pVX1EDZ7tnSP
	k1L0zbXzd+E/FrNWAw8JmgE9qdGj39grT4B+/d/IUpu0BNekwLU5gvSPSVPh+LiOkb3c/dO7FE9
	97S8gT5UG2D27S5v38VGHFV252KHrYY6+6fj625IoHG6qP3wz8vndkLo6gbhe9no=
X-Gm-Gg: Acq92OFkRMovpbmEmjysVY27koZvFBqS8mIkjt5JYWruw2kATPTgBgWbIqJqjNsxGJ9
	s7Bu308RONQ6t/vQ5MqoamcJQHODeNjb8ztD2b/VFpJYwZzh5CGJcEBBhCHHFvX2CDaOQYJ4v7o
	lhhE8dscdQA2TFZHw2bltMAVeu3Qt9mK4pLr34ODROb3rPH8+tIQn2563cfRWqsjiZHE11Cq6uZ
	H8yrLWVD18/Iu3YEaPbmJbWxuzrZISA6vVThl8f6UeddbBK19KTM4aC+OEAFSANujOwrOia5SuR
	teiO0R013xeW962Y6NXuf7BnqJRGqrEC1kwK2/j9Yd9IT475CNbkEOLiar1tCDP7OMIj6XhqK9J
	NF4pMMpYnijLvDAD9eEYSlq9aqA6yXhQrx7Q2PmrSVcx0AKvaMyLbqLaGlwTY
X-Received: by 2002:a17:903:2a86:b0:2c2:78c4:b74e with SMTP id d9443c01a7336-2c278c4ba2emr582555ad.27.1780853196799;
        Sun, 07 Jun 2026 10:26:36 -0700 (PDT)
X-Received: by 2002:a17:903:2a86:b0:2c2:78c4:b74e with SMTP id d9443c01a7336-2c278c4ba2emr582335ad.27.1780853196309;
        Sun, 07 Jun 2026 10:26:36 -0700 (PDT)
Received: from [10.216.62.12] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164fa3a5fsm163513775ad.36.2026.06.07.10.26.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jun 2026 10:26:36 -0700 (PDT)
Message-ID: <af47be11-bc00-472f-aa61-35c8021e7fac@oss.qualcomm.com>
Date: Sun, 7 Jun 2026 22:56:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: Update DSP firmware for sa8775p platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
References: <24b6e1e5-5d2e-49f2-8d63-a921eaf3ab3b@oss.qualcomm.com>
 <CAO9ioeXOROr4rQvkGWmy3OG-03Dq-P9B1XnJXutVOzVn0dEC0g@mail.gmail.com>
 <f2644d05-ec91-4a96-9f92-6993a7bf078d@oss.qualcomm.com>
 <2vrx3wv3zztn44sglmpcyyfslq4npaw47iytchn6ffphcra5jx@mckreexfsd6e>
Content-Language: en-US
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
In-Reply-To: <2vrx3wv3zztn44sglmpcyyfslq4npaw47iytchn6ffphcra5jx@mckreexfsd6e>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cvmrVV4i c=1 sm=1 tr=0 ts=6a25a9cd cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=rIb-7ywQNSyxfgXytSwA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDE3NCBTYWx0ZWRfX588cwTb7PK6D
 aO2dD8y0I8JwiEBKjfISCTYt+AHNMIQ1XkRRa29brINvcWMWVxIYZsLPXtZYOhEooafTx8+0kEI
 1f1w/KS2rOe3GZplAoW/EejRKii5p0TTTgKufp8xgDixAzfMhQOTju3WthGxx+l3zlVuoJgfEVQ
 p99nntzjLrrRDFHo+zJwGtsSJfP562eEajqj+bKQDgadMklpH0vXuHVtRrecwXWD7hBzm1PEGe+
 SBYwAHcruYDGrwXFszd30inLbC+gWFdsyFcxYIcU6U7erPUEzzKWgeyYmcwT/9UDi54r48gxsEu
 1jjTZIg7TehBzt050LkcjnNl4l8IobZFC0BiAAMyAU8ZVl1ybRNwjtSxaQWTYBkzMBKD870RHDe
 E4coMBAqeUFS1Pa83vlFZpbH1nTWNe3no/11MvspSYO9SDw2TsaSj5BRhP5oQwRT07krsVmDY65
 vLmLnD9M4+QdhvYQi3g==
X-Proofpoint-GUID: _s5ntoR4_Dmb8jmkFmY35qvJ5vPM6Ebi
X-Proofpoint-ORIG-GUID: _s5ntoR4_Dmb8jmkFmY35qvJ5vPM6Ebi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070174

--Noted Taken care off now.

On 6/7/2026 1:57 PM, Dmitry Baryshkov wrote:
> --There has been a change in the folder structure for Fluence Module
> compilation to go inline with the Fluence changes on the latest mainlines.
> The corresponding dependencies across needed a change and this fix has been
> included here.
> --CENG is a Compression Engine. This code needed fixes from Static Analysis
> and they have been picked accordingly.

