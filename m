Return-Path: <SRS0=be0w=7O=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ACDFD1681D
	for <linux-firmware@archiver.kernel.org>; Fri,  9 Jan 2026 11:58:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E0F1CC19423; Fri,  9 Jan 2026 11:58:21 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 140A7C4CEF1
	for <linux-firmware@kernel.org>; Fri,  9 Jan 2026 11:58:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 140A7C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60982b1N2184030
	for <linux-firmware@kernel.org>; Fri, 9 Jan 2026 11:58:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G4aDex18Yv9rsxvqoogQx9moJ+3Zcc4IsIwqvrMBa/A=; b=cwOGkB/fqXrm7ctq
	DvDNSKMBPuL3Spw9z6Ik4qKt6Td9l+QwjVK/1PocN0jJHAqMuUqwLIN6gvkltgHE
	qSpc59X7tadNJjyHjW/2ag5ymQxwTNyVOO0EWlWse4WjaZ29sNu/n9dM0kRS3XDo
	kFkpYJVgMRch7cnDOtSSGgR2VUw4Z2H0kD7rNr1vrSbWNT/rKOES5g9NP/JYIWno
	WbS+d5/Ko0ih9q/H/ejIvk7dt7LSRDpNH3NySbtvU0ZC0MH2/oieV7DDps188tl/
	wZmOWghPicmazvGN8P97MqUkAcXbkRse9x5N7+oiQ5rPj0gh2Fds3XWnBvzWO89I
	wGf4TQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjwtn8qhv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 09 Jan 2026 11:58:20 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-890587d4e87so94007306d6.0
        for <linux-firmware@kernel.org>; Fri, 09 Jan 2026 03:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767959899; x=1768564699; darn=kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G4aDex18Yv9rsxvqoogQx9moJ+3Zcc4IsIwqvrMBa/A=;
        b=bOrvR5aOaN/G3+npC3/m3Spp7UNHOeZO5Vab750mDfOOIEf4See1YesCPmm4B9VN7G
         wSrfVMTiKrF7T/A2dv4i91aROD7Xh+735RZBOlfhV+7VRW3cdw65SJTLBjp7MClwRIbq
         we17UX7P++L4KZ2gESXQMduByUx9P+QFg9VzFt9Li8rl1c782RDWzkxOJiasuHL7L6ug
         MyyGoCYeIzP351sBjCl5aYVyPqS8sooCBeWrDSUguK8e/aKdQyb+QPx/iCrupZe+uUPG
         BIs3J2+cQjtfDekYs8mWYyTw5plP/vKnamrrUYxYvS3BqvM5HaHcyoV2qXzVqmCIzJTZ
         Kakg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767959899; x=1768564699;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G4aDex18Yv9rsxvqoogQx9moJ+3Zcc4IsIwqvrMBa/A=;
        b=ZQkE0gYvohL3P62t198eP4CRtgeVVwGZA28OkMOPxLbfmBlGijJZjc0+fAmYQBFWIz
         6p6bNq3xICi7+Te7dogAYxXl6m72Ln7FsW4QYOAGzc8Wbr/6vlVSMwfNQBjXwdMINY5p
         fBJjsOsZoX9UJ0gQAWvWCxYjzwy9WxAm1eyYx8x+aynfzfaIjohA+HlSKeJuLGYWOxjj
         k2iSTscblnijNrz/Xga45i8FnhyBLcWc/4vRzDpSpXA//B10IqRUPz/smrxLKttpebtI
         vZmyRnghRibyzr11ck7XtmC8TCJHdvOHV3jNG6euYu9FZFMthHn+c1a+TgLQSdpjAoj0
         BhCQ==
X-Gm-Message-State: AOJu0YxkF+qd0iPye2FbNFTn6AuR4sjWFUSLRsqdsIAFT45WKtJdhghF
	x4WCf25300PK9XzyHZ8HLuNHebgJ9JIa/s16gn/BVz46pPm002yPmPi20XO69KzTFwDQ29pHDxJ
	JO6W8q3PxovypgUHSbkRa3cG3zR1b6shaN9jI6AEJxxwxcjXG3AuXyFo3J5us4FU=
X-Gm-Gg: AY/fxX7s+fiFnzm0ZILyqMi4dzBJCFa0E8tUFND/P3JkU+5vpZaagzp1gLxUNt8CJw2
	NCUttXmTYTNkH4wHqOQ8LmIJ5Br+fhkkntY3ALyHnGWv8SqJd+QX0DEnbkF9at6uK9fGW9op2pP
	KVCrqPjSuNpWzmnPdvqD64XxVrWlNETEd3coWyYN7Ocn7R42W1pVCses0roMuMZcPBkZ/OpCCbX
	Zel8ucfAoRMFqGp8Swa4MojqT+aqbPb7C/LId98evRND3BuoRhC6g39Hon+ZdO0FzC9muhGybv3
	7QRAET2THKNPF7kRGPr4NbxD8Dp6CAeiZIvFhTmi6OQGaMva/Gvbb5+dORBIqhQ1m7uyfukCRsm
	LqDfAEUJksnoZy+nu4OY45eMEQ0HXzRAHB5lcnL+7c6JjSJelM+QWCbsKHUGz++Jto7uCN5PCOF
	zuQZMdQzBVGVi0ymD2X7NQVbs=
X-Received: by 2002:a05:6214:400b:b0:888:4930:c4c9 with SMTP id 6a1803df08f44-890842baf5bmr132518906d6.69.1767959899108;
        Fri, 09 Jan 2026 03:58:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGNVRzGXL1V3+cLEQQ3EKuBh7HEdOMfJmMTftd9ejBXEvLvCEpzMRFxIBpMoUrH77uSq+psgQ==
X-Received: by 2002:a05:6214:400b:b0:888:4930:c4c9 with SMTP id 6a1803df08f44-890842baf5bmr132518656d6.69.1767959898658;
        Fri, 09 Jan 2026 03:58:18 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b717e7f34sm1871969e87.61.2026.01.09.03.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 03:58:17 -0800 (PST)
Date: Fri, 9 Jan 2026 13:58:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vivek Sahu <vivek.sahu@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org,
        "Mohammed Sameer Mulla (QUIC)" <quic_mohamull@quicinc.com>,
        "Harish Bandi (QUIC)" <quic_hbandi@quicinc.com>,
        quic_janathot@quicinc.com
Subject: Re: QCA: Add Bluetooth firmware for QCC2072 uart interface
Message-ID: <7mrtbr4nj2zrvsratiuhihigsizxhk47nlrne77k3xvoyqt5j6@gymo54u7mrxo>
References: <ade99252-a85c-4399-92f1-56156f509814@oss.qualcomm.com>
 <iep7i32ovru6j42fx5l54rmw3ihhoetd4isvwpkvvwlekujcx3@ytwjeawwqz6w>
 <ead2a8c2-c466-4f37-a9db-79a54bcd6a22@oss.qualcomm.com>
 <cf73c9a9-e29c-438f-a2b2-20cf9d3f49b6@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cf73c9a9-e29c-438f-a2b2-20cf9d3f49b6@oss.qualcomm.com>
X-Proofpoint-GUID: 0AiwnF-FkCWLKJtlwAZn0E5UUI4Vcbh6
X-Proofpoint-ORIG-GUID: 0AiwnF-FkCWLKJtlwAZn0E5UUI4Vcbh6
X-Authority-Analysis: v=2.4 cv=Uohu9uwB c=1 sm=1 tr=0 ts=6960ed5c cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=p0WdMEafAAAA:8 a=Ui7A4lDhXI2vupbLGyAA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA4OCBTYWx0ZWRfX5DtnGvqa0ujL
 3KX6NiZynJIbNUhB87i7VywHTZOdnlSPOqXZ+/ZoIohZ++40nTzDOA99BD6yW1gS13k9n9x+604
 b59f/34HXXcIXPCLw7Xo0chZBlg+LgJRGGFzfQIudiN/50f213aPUjsxvfPEPG2WQa0FT6COh4Q
 mmOCgBtPZl4ugEKikyNgsu2JPONSk0yaQbKlFl7/EA30+P3hy2Wc4JMisU3FGUq5ukIqN7FAvm/
 eG+/My3zmI9w0p7jO0KVjwKef3Xz5wtTb4F0u12aWJo3iE5rSPhyatcWo5iyoBU3YR35Higu/nT
 qYRfgBjh8Mu5aVR1ofYqtqjZNfU8WjsXP8LGuBDwPxzcnv91Ry+wEZ/R+g0rbWAe6cl5XvgtGuV
 OaHW+1QbpUgWhPFQckODV0UXFfVtBoP48zcBJC3KolxrZ09Hftp8ETQO7R3PLhkj0xB/HdfuYuH
 f1Po74X8mHJlXiVI9GA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_03,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090088

On Fri, Jan 09, 2026 at 02:03:49PM +0530, Vivek Sahu wrote:
> Hi Dmitry,
> 
> Please ignore the previous commit. Below is the snapshot of the new commit.
> 
> 
> The following changes since commit 59df6ceeb259a81eb13cae36a44179981e95abde:
> 
>   linux-firmware: update firmware for MT7922 WiFi device (2025-06-06
> 15:21:11 -0400)
> 
> are available in the Git repository at:
> 
>   https://github.com/vivesahu-huboss/Cologne_FW_Upstream_2.git HEAD
> 
> for you to fetch changes up to 56c89c0197463faa69f2f94576eb8b9a83de3580:
> 
>   QCA: Add Bluetooth firmware for QCC2072 uart interface (2026-01-09
> 12:41:38 +0530)

Merged and pushed out:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/850

> 
> ----------------------------------------------------------------
> Vivek Sahu (1):
>       QCA: Add Bluetooth firmware for QCC2072 uart interface
> 
>  WHENCE            |  10 ++++++++++
>  qca/ornbtfw11.tlv | Bin 0 -> 216274 bytes
>  qca/ornnv11.bin   | Bin 0 -> 10880 bytes
>  3 files changed, 10 insertions(+)
>  create mode 100644 qca/ornbtfw11.tlv
>  create mode 100644 qca/ornnv11.bin
> 

-- 
With best wishes
Dmitry
