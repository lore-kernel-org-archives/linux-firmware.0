Return-Path: <SRS0=kCUS=FV=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE903C531D0
	for <linux-firmware@archiver.kernel.org>; Mon, 27 Jul 2026 14:32:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AD78C1F00A3D; Mon, 27 Jul 2026 14:32:00 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1785162720;
	b=dlkMUB28AEWbsNdWyGKq7lJkoHqMHV56L/QkNImRx/2SXZpe5QOkOysbZiu3CGCK1INb
	 QPrGMcHyML5XxUoWBRjFCLBRv5C3ReQfraYRuBwrbJfMWenawULh9XB+gWOELXqpYNttd
	 jVJewvxfpQnsgO0iNJEX66RJB15OcNWTo8o0koAHFJU5bRiWu0DCZ7Fk7DfTxq6ASvh/N
	 DvIgKqe0Q2mgA9lhN5aYggZxaEewcfJnEUZVUevDG4Z0guSry0q3Va1BfMrr6f4dHmT+A
	 YrqwclPrTRjyDUDu8beMjb7RYB0PNqL1t86B+LMXS9r8VrQNvHtsbLBD1+zY2jwJmpQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1785162720;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=W3bawCDfeQitllYpEyxH9lcmR1BQu8zV93fRYE8eCzE=;
	b=vDgt3A46CUxYGqTTIgZOAfZnm4rU4fyajpF6xGqYdptCOaoIXQH7DlOZhmPg45yAwUDi
	 pLypSxXOAAsLFZXnN+9h/dRpsnKrocSJfja+T5Kqdz1iPuTLlGe9uOgs7gj4P6RBOpwGV
	 YB+QP/JBlKgYGNb+ZRA1+/rIPUhSotC5xfq8qwaN5uiFP2R+vfMWQ71DebItCrGWJMf4W
	 PayKf+OxeN9tXT0XmOORJMqKJ423oIg+mOYAn2fES0HmXzC2OQ4iPS0N1hvQBMEDVfKi6
	 DyXVl8I0VskPJ6VuK/c5DKV2ZCu1MuoXV1DrQu6PDFDCZbxgbMV8+GQtiTGMlyGiX9g==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gS3Sjpkj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ce8iG93D;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CD0321F000E9
	for <linux-firmware@kernel.org>; Mon, 27 Jul 2026 14:31:59 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gS3Sjpkj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ce8iG93D
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org CD0321F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDliDF4061201
	for <linux-firmware@kernel.org>; Mon, 27 Jul 2026 14:31:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=W3bawCDfeQitllYpEyxH9lcm
	R1BQu8zV93fRYE8eCzE=; b=gS3Sjpkjq8VI/Pz0S7SYXIWavwDZewUkh9129+OD
	uLCc3cD5Aw1EIt55460T5vGtd52Rety5NkwfezPGtap8Fb/kB88SMasH+JJ6K0yk
	fAfaXTS4D79fVSHXBpKUiGgn1k9wsg32CaiH7Lf6IG+unXOKfNXtGV00BscFGy4+
	k3T6zlmzWOOWMmGGfVEBcmoCP2k6dU4ShaeVVi1k/y5MDsa+r4gVHieWg2fB0We9
	CkxKL3rSholCZzCJD9cqdoKTMP/Cxgq63zIV/G9gfwhz0YgoM4AU3mUd+7ryso++
	7ScwF5y4OoFSgCbmQ2o16gzDcm8jyZuBW7+5ZGOkUxhaZA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4mq1638-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 27 Jul 2026 14:31:58 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-976c865a8d8so92281241.2
        for <linux-firmware@kernel.org>; Mon, 27 Jul 2026 07:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785162718; x=1785767518; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W3bawCDfeQitllYpEyxH9lcmR1BQu8zV93fRYE8eCzE=;
        b=Ce8iG93Dj4bP6BbHhEU4WRYl7+9lV0FTNrocJm1En9r0JTD60vzjcgDLkCVZY50Lbj
         MCnhashiBjA2PLvLp9iSPLfFsyi/I1kZHeKTaZTI0jBaOxdKSolV0bOt1NMR36JIXH32
         lmNYJ8WJS0kUab3LRZjAw9zQ3E+dMhD0i5gJjD0KSu3gaPEiuYMIRUZ0HFMpt9Fngdnv
         ofBBFYgxOjfKxW65Nnip8IhLZxQnJjM1eSuXi37j9KgbG+/mFPeRGNGOFGDPV41Zhcdy
         psEgPIBIANWw8w/cVQVsI/TF/Jk4L2Aq9Ik7USM9VAi72YutjCcvR5+4LYupmeYkIsk8
         S5eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785162718; x=1785767518;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W3bawCDfeQitllYpEyxH9lcmR1BQu8zV93fRYE8eCzE=;
        b=akJdHCZ/VPJVwQVX1DX9ZX8lAFBCevtwKejgLgff2qa7wtvN46G+XIfztr6TOy6N1W
         k/JbIOCtW1U0squlJix43Ppfs2Lkpy6alxKsg/UuaLhjPJNIoXrYeQAOD6HigUVXwStY
         7PjTTAd0qjdHIE0iZsGXsi/XMcOOFk7LIZZIjZLTdnoffvTXcQd/FaFH2Nr6eyLxEtfF
         KR1+WuJVB+c7MmJkA3pYYsFSnl+2+VmsNVhrq01WCW/zDxK9A9maOZAK2xB7lLAiQsLo
         9u2bI0hZQyYy+aHHOz9Wv90Yx+QGHWezvmZ06zjh7JoindnwiguAV7DNlSS0dQ2vKxoH
         m2zg==
X-Gm-Message-State: AOJu0Yx5ZB42m+cwybqiK+TyjSOXpSTR+oMP4+Z4PDQPtSdGD+v4pWUD
	CkhOiOaca+vj2iYkW6FDCkABVRuK7ot3ap+F0jHqNj0H+oSg8pmaUCUd1+bwnCtuqQJV2cmFQOL
	XUWOK46HiOtyGvrKmqPxtTbufxj1efaqUj0284ymUoYu+zcpIeORx8GTkYSEnJUY=
X-Gm-Gg: AR+sD12N35Xzic7InEByikjxvpq7PnErR5XB+cxhPYmqmo+3zH0xSxXL42Lzbc7Nf19
	hfHiM3U+UZdsWwsfOGsklhibfcJR0S3PVRXvWjZwYLTXAJ6HQik6/EXYgx1Fwu/uB8HuHmSLUAA
	fCb0lRWGgYVicyjj4xJ+yjXq+M3+IW8zglaRU6JKd+lTayFxSGxZdpvdmvGm4TCRuxr5j1tNuIA
	8bF4xFgSn57jJPrinLFPvi5LdYKuK1VunXabWqVicIkuJ8kugN3LFahiVJBCmjT6N+i4PdVEdkx
	0TRwNU83RMXTRET5r7XFvBfaE4KEUCo7hZ73iUpqVU6foWRpvgLuvc60AwrU1NqlGqbigjyIBWI
	TNJqef+ECt9nPplptq0nQTFpnGNlVo9RJEipn749dQzGKbx469Ie1eqXPiF/pa/TfTz4btzuAO9
	LG3pyzxctmwxhoYg==
X-Received: by 2002:a05:6102:441d:b0:737:4cac:52f1 with SMTP id ada2fe7eead31-7503df5ccfemr4353790137.1.1785162717976;
        Mon, 27 Jul 2026 07:31:57 -0700 (PDT)
X-Received: by 2002:a05:6102:441d:b0:737:4cac:52f1 with SMTP id ada2fe7eead31-7503df5ccfemr4353732137.1.1785162717405;
        Mon, 27 Jul 2026 07:31:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39f22187e70sm13506211fa.18.2026.07.27.07.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 07:31:56 -0700 (PDT)
Date: Mon, 27 Jul 2026 17:31:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srikanth Katakam <srikanth.katakam@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, dbaryshk@qti.qualcomm.com,
        raghukan@qti.qualcomm.com, vkasinat@qti.qualcomm.com,
        rajup@qti.qualcomm.com, kbajaj@qti.qualcomm.com,
        vkraleti@qti.qualcomm.com, saddam.patan@oss.qualcomm.com
Subject: Re: qcom: Update qdsp6sw firmware for shikra platform
Message-ID: <qqeamza5mhftvyvxpb52ehb27il5axykoppisoy6ksa7eacptu@3j5er2bxpiog>
References: <78adb7e2-9950-4999-a066-684d150b0d05@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78adb7e2-9950-4999-a066-684d150b0d05@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzNyBTYWx0ZWRfX5rpuJ2h0gSUZ
 cvR+x0ojbFkosZR/8D2ZyHd1KL+q8qk6zExjXiabn1T9ZAGbo8BHachprmmwhdNg9nkeymFkW26
 Og9MczYQABB8qiziwg+DMlcnz5TXGAw=
X-Proofpoint-ORIG-GUID: m88d9kBRWPxWBqoRVtGh343Q7FYRXEzD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzNyBTYWx0ZWRfX+lW4IlsfLICb
 EIDERtoecjUEf3NI2Zdt8u0e1JKuyq7sp2iunypsZGs1XHQ/9/pfcrkjc8sEqmf/qk3ZDfeIT93
 pvK4BL6y3FPyWxXmTOjEq0JEaJKBIf0vGgG05sy9Tdz7b8W2CAyD+sJ0cOAk5wyS42YBheKqk+n
 Uhv8ZCY+I7GQw85jc38bW0nIxfL8wd3LmlN2VBb+h7cctijo3JUyVZTdbQMWRLn20HI1RJYSjEg
 ap4CwIy9jHA6+zGw94C2kb6v4IW82ALIoScRoLlJDNKqw+zzIN52LX6kXTZddvLNpWAR7S+kG+x
 K4g8LLtu7xrLG+SQymAluWdRnz40Ev9BxIBWwklOU8uZUxTr5enDDECE+7wdzT5/WVSvWOR/8EC
 9w6JOLd5FLkR63PIDbNyXjGJPmH95DtbQdXFTt/a23Tx9NVSwBMITKCQCsYkwEcYfCNFQdAQ/JH
 of1xLBu5e2KKp3rDoaA==
X-Proofpoint-GUID: m88d9kBRWPxWBqoRVtGh343Q7FYRXEzD
X-Authority-Analysis: v=2.4 cv=TemmcxQh c=1 sm=1 tr=0 ts=6a676bde cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=qC_FGOx9AAAA:8
 a=PEhP16JNp4rB1GLpUKUA:9 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270137

On Mon, Jul 27, 2026 at 12:55:53AM +0530, Srikanth Katakam wrote:
> The following changes since commit 924d73c9a2501a256d18a26cbe640548c70b3a9a:
> 
>   Merge branch 'robot/pr-0-1784191359' into 'main' (2026-07-16 10:39:46
> +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> modem-fw-shikra7
> 
> for you to fetch changes up to b4763ad2e9fee502446cd89b7a5b9a64bc7bb968:
> 
>   qcom: Update qdsp6sw firmware for shikra platform (2026-07-27 00:37:30
> +0530)
> 

Missing commit message. Please describe the changes incorporated in the
update to help integrators to decide whether they need to pick up these
changes as soon as possible or it's fine to postpone it.

-- 
With best wishes
Dmitry
