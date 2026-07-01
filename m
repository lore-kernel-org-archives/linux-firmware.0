Return-Path: <SRS0=7LK8=E3=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 183A5C43327
	for <linux-firmware@archiver.kernel.org>; Wed,  1 Jul 2026 10:38:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E71CF1F00A3A; Wed,  1 Jul 2026 10:38:34 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1782902314;
	b=0GgpfIMGIoX6jTowbPCRLBEzKlCFIXnrPuaLxgYLzpV9TsHFYRz3Bj9ON54CNPMYXNCd
	 glZwUzDn5pud0zJ9n1wgy36GJuSsWqQW9OwwWOmc1k8UluFHCqXoCU7QuJKQmLZmsdrZG
	 KtffnYPVhXlIGSnjrS+Ie9cp+8hU7cPBxThM52QdBLGjaptJMhJBl5py1ckLCYKJnzrIq
	 0vj9UiPHJtIHUPGYvdlfG5fmGtl2ID2mlw85/2ZFoBJwz/RUUQ8//7osf9m5KjzEx7glN
	 C5PlV5WNWH4U127TeiSg4Ao2Bh2tM+i6tEthB0y29EEx8+2RcoCfExg7jdEgPHMXrkA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1782902314;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RE4gtdzZqfLRzZx5njVbySZ/6ofzmShUMUJAY/pHxSI=;
	b=FYGUyzV32Eb+oKz0czXVbuiZZLRwNC6k1bxknlsRAOqmjg9Ar1Vem9QU45NpC8ClY1fz
	 E/5F3fgvayDfR6SRvbWmVUaER3/qHzZ3OlZn1ZXvGXmp3mW74wfKiU5htxbD0oS2VuVf0
	 xzq6R35NXODgXDaE5no7ElovIUHxDapXic3Re00eftj075Z3sUmRLKNMTa6s0qvZPzTQB
	 PDOUO5+BSEbee8AAeFpEEeLOXlF+NOix0lX43qWtCoWSvXTVZT5bpGC7X2UTkquQGh+P/
	 Fz4epek/jsHxazjh0C0/quVvbff490WpKjsWRpH5KfdC3BVYMGlYvnXBYaYIZ0Wdriw==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IW02Ax4F;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eMtDLjcR;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 57F921F000E9
	for <linux-firmware@kernel.org>; Wed,  1 Jul 2026 10:38:34 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IW02Ax4F;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eMtDLjcR
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 57F921F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8Ulw643999
	for <linux-firmware@kernel.org>; Wed, 1 Jul 2026 10:38:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RE4gtdzZqfLRzZx5njVbySZ/
	6ofzmShUMUJAY/pHxSI=; b=IW02Ax4FODrJIEK6zauBB1HYJrPfbKDs/QgTJHN/
	gvOiaTZO+rjHBe36QgO2H2aQjyaRPpZs/rC1WXC7Kx35eLaNsU/qjkUb4Wj2uKLo
	XWWOVRBUyOaJ6mP617pEIdh8GvEe9VAUGZE08WmPA0zY+HwguyIvwWY/mopACcpr
	cdbi+/1rbNpUu71h76oCPdVm4olFFj0B//ERli3vZuzigcvLYJP3GXNK5Wrp94CG
	JPxtDez+X/U60MebhZH8eKi21PuWP4DIuIgL1r0aVcnO6MLXfbkxH0ETtemi5e8q
	Bxua3x1sJAQ5vQJgXPW8P7l9qdvJecrSu6Yepzlv4W5FYA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4hbd4bby-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 01 Jul 2026 10:38:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e66f9e2baso47234985a.0
        for <linux-firmware@kernel.org>; Wed, 01 Jul 2026 03:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782902313; x=1783507113; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RE4gtdzZqfLRzZx5njVbySZ/6ofzmShUMUJAY/pHxSI=;
        b=eMtDLjcRkkl9sHVfMeMZYhDXDdmquwO1C/CZHmPcBYUaliBOeiZELl1BlzqBZ7IbPf
         /SvK6b+K6M+k6OC3WRC4awxFkjlKA7snMOhpE6JI1iJu1FIMwhJlAvTkku6ewp9YGxph
         kPmHCsyQRXdKzu7t3D23g/RtdUCbpP2KotWCGca3ClJ25c9N/ZJVgH74ftU7uS3jig0z
         A0UeNMCIg9zzqVQ5qQmBWISgv/0Z8uGm24l3En619oO4RuzdsfhTtizAxC8H0khE440n
         x66lbG20EZo+bRx4bQ1Syz1M0qR5Aorb9CjzAh7MbadQ8IsbOXSCkC9OW+k9qi81XGTR
         GJZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782902313; x=1783507113;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RE4gtdzZqfLRzZx5njVbySZ/6ofzmShUMUJAY/pHxSI=;
        b=TdBSGTqgfU9qtfQ1V2Z1oCpRjpB+kTCk2hz3ez/DssxmPBBe8VdjACvJdbS0IKLdIC
         6dvT8yO7eLMm4oHbUPjP/rK7LfARu5xO62Gz8E1y5BntsyMpIiwdZuJVVHt9KcVHzPlF
         sWL1qdN4LXqRUqoNcS+k/ASjx0PjHIQSasJotguD8RG1wY6UmH73xzHDDzJtIlELZDos
         HtIFvyeUSQ6Y452ZP8hFB3xQxz1jwLA8ZdYKFrtY1AHGY5G+YxB8WTGqlO4y5wO/aCsP
         bVa0qFztYgg5k9MI9oNSe+95y0BVFwrwwVCrie2ABpyVj5aCuNDBZErMGUTwRMQNGEd4
         +wWw==
X-Gm-Message-State: AOJu0YwKM3FdcoLQDakOhmMPv7kNk5aOWTq5OB5Fz6VHx9ghzJsoesRJ
	N8eYhEWbolXL9V9H/FX9muCtFoxe9fhds5J33/o3GLSvH0tf/fbLoEhmnJ3kMqDo4hH4TfbPns6
	TyiDgu9AdvqBwrmJylB6QLxgjpNuQHc43Ic+3G4FaQZsMqQU03xq72NI3t5wYMIs=
X-Gm-Gg: AfdE7cklRGgZ0MLYvqOYXr1IfsOxrytYcfwpkbZogj5N3BZJbC1dLyg+0sCUAILkqFn
	DDG7DR38/kCEYI65BHLPn9dmqwb0q0587BBdgNFudizpW9Z4UFzuG/7aU3Y46Hb4MFyxSnXUYKU
	CuCzY/jcm/FgrQlGYX7aQLxrE/nPAqQC/BwuzQ72lAAnHw9gtI1sSALY2xzyJDYQ7JQOB62RN85
	TYEvq9k5YStFpwAvEVyYFGSdf4mzRgR5jTjWT7J5+AiCHhtCdKUAAub7s0vCTfA+MUefDP9mibg
	eihgMumt4ydTTJFykEOxr9/AMMM7tfaEByVgZPaijmFOX7bBI/Y3uK71borRMIT3S4ulsYt+YEl
	bm17rcu+SVXmIfTQqm0b1pe3PzhbHJVhZcARStEBgNrFKe4e4KSn7252HqZq+XVaMlpZaHsOyRP
	tIBZczO0rolhC8LqLBh8gRQNQi
X-Received: by 2002:a05:620a:40d3:b0:92e:745c:6c48 with SMTP id af79cd13be357-92e7b3fdb2emr35185085a.34.1782902312762;
        Wed, 01 Jul 2026 03:38:32 -0700 (PDT)
X-Received: by 2002:a05:620a:40d3:b0:92e:745c:6c48 with SMTP id af79cd13be357-92e7b3fdb2emr35182385a.34.1782902312282;
        Wed, 01 Jul 2026 03:38:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aebe344ef8sm1153527e87.31.2026.07.01.03.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 03:38:29 -0700 (PDT)
Date: Wed, 1 Jul 2026 13:38:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Simon Trimmer <simont@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, patches@opensource.cirrus.com
Subject: Re: [PULL v1 linux-firmware] cirrus: cs35l56: Add firmware for
 Cirrus Amps for a few Dell laptops  (20260701)
Message-ID: <l7273xevlsgns4udv4vthsrmzdqixupwq5y5qasyxd4drrpzpg@q3wq2bx6vixt>
References: <001001dd0942$1ea0f760$5be2e620$@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <001001dd0942$1ea0f760$5be2e620$@opensource.cirrus.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDExMSBTYWx0ZWRfX/RPIDZPSdMlP
 epori6rsO5kL6DPiSjiDonFr1RGogepn1YtkxmJ3913j0kXQzzzIp+LrJb34vtK7d/+iy91CLL7
 I7kmceUlBkbwMhFTby+Blu+65cg30w8=
X-Authority-Analysis: v=2.4 cv=MpJiLWae c=1 sm=1 tr=0 ts=6a44ee29 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=p0WdMEafAAAA:8
 a=Nv5Z5aEfFZFpnmmaAHcA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: k2xSV8cUschcJZETiMoYXPbb9-k29DTc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDExMSBTYWx0ZWRfX1tkhRZ4ZQrty
 0qDAIyqweDbk1hMWmCVBZSVdFZRVcAsnZImOVZ+vW5KkjxVtCfsCV1ur3TzT6Vnfv+HByvQc9IK
 +UhHQUm8HEP2epEhQIXUf+xwJTfpLUImzTMWMkN2kYQPDih5NznxhVc001Bw0u5jhnCG+T0yypm
 UizUQnh34/yTfC/q6Xdt3+FUEANpu6jbS5zbsNCL8RHYerSWw2t80Z2ADCIub8mq8MonfcaXVea
 pVBHVMkt2mEB79v+KgdAx3v4jdu5IaeNIOpn9gWBp8ZgKwEQnY2GGIqxc+CulRtGJqrJwn5MZ+W
 5ewbDXIFWCAQ0Vmw+Tw0ETOx19OXulMXMsjrSPBV+G3IbJ10vqkwitcWB5vfpSJaszwzNiACh/Z
 VCQ9xAbuOECQulY4SpzXftWmEhyXMSdHyV/J7LfNLuc9pf9PsU4xEXp/Nq6LVcHIzzkqO24a/ox
 D78XDGj4ICO0w8raYow==
X-Proofpoint-GUID: k2xSV8cUschcJZETiMoYXPbb9-k29DTc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607010111

On Wed, Jul 01, 2026 at 11:12:27AM +0100, Simon Trimmer wrote:
> Hi,
> 
> I'd like to add support for the Cirrus smart amplifiers for another couple
> of Dell laptops, this is just a set of WHENCE links.

Thanks, merged and pushed out:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1131

> 
> Thanks,
> 
> -Simon
> 
>  
> 

-- 
With best wishes
Dmitry
