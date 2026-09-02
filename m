Return-Path: <SRS0=oSiP=G2=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C05C624D0
	for <linux-firmware@archiver.kernel.org>; Wed,  2 Sep 2026 11:34:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C1FA21F00A3A; Wed,  2 Sep 2026 11:34:25 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1788348865;
	b=gs3xpBIhlDn/D0ulSVzrALS6F04p1+KUGB+dSdGHjoEppmT3qVI7ljcjIEZu0s3RaW5V
	 Asp9tV/YG+EfUPjiSGuyBYFGM9nINuiNN8NPvot5W+/WOYmGedLGhw1/x6Sy6xa6aAwsQ
	 3+0/RVxYAiS/aWeqxjC3SiNvF0QH3aTgzwZldgGv5WXvIRtV6+AJl3r7zlPiWxc0bRszM
	 RPv6PM89NfRcL7tFh3YdVMldIWtosrPM355K+TetpMlfACEHBuQH6g06Y5FprY4kir9xN
	 FO6RIZDi35yg6xKvmPAdaRlFl7/bnwTLhiSUiZJgy6bkKRkMlbSziNOdNf7WTw42hpg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1788348865;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=wBtWgev0V7JTZ56LWwg9bDwUw7OT4UvL1EjZvUIiNxc=;
	b=pTMqOIuzHAn+d7esbQTksAlgyjm0TRwnakN6v5NJlDApHXC9pIUhx0xw9zQbeqxOq0/p
	 Yu6d2jtUqlgXZ8gqr80i4ckn5oTxxeE2Swl5O2BHIuA3Rw5NDHxYMyKdCjstpGWtq5GNA
	 4kvIqJEPwb2yeUUT3TaUcHsHEok1bhRxrRBKXKO5BY0ZtNFrsqBPvKe5vTVGdwqhPQxS+
	 G6li7b6mosLJoI/0XBA/DHwKKOt6RcN3eTbKI9BskdwlC5vs8gs93LEnb6ivMJrf0q0g+
	 7ekRZm+KtkgUgCWRy5+mi1eKFB1XrgMmBat7IYARSCxjXA1NuYGWxC6IPUhf9Ga/16w==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="AscUiv9/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=glqmNoyR;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 191961F000E9
	for <linux-firmware@kernel.org>; Wed,  2 Sep 2026 11:34:24 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AscUiv9/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=glqmNoyR
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 191961F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6829NM4B528829
	for <linux-firmware@kernel.org>; Wed, 2 Sep 2026 11:34:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wBtWgev0V7JTZ56LWwg9bDwU
	w7OT4UvL1EjZvUIiNxc=; b=AscUiv9/d9jN1J/Fq9MQH+q8tYGvi+BKDGxa0MYv
	V5M2AmwQoXjjmYEErTbqCncx+dvJhfLOM/puy0PU4I3W80g/OnrH/g4Lsq6r2e14
	h/7nwcmLpahykUa8zqL2GvvdySLQcVTksBhf6XQpDxxNXrMt92Qn4DTmR6fl0dno
	eWOYaZSzPm7jXwaTnTo6lZAuIIsR0hQ2iBXcNiFAH5vZOi7JecPyHCkL6R82nQxp
	/fL999ShN3NRP5yarJPGyV/RGxbpw5UKuXKQ7nbeSU7EGYySYUL2uFsSc6waqj7z
	xvskrynjq7N76XkHOArdulTYV947bU+MVaQPXUM2b7Yo/A==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge397bq1m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 02 Sep 2026 11:34:23 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-738627c7908so231430137.2
        for <linux-firmware@kernel.org>; Wed, 02 Sep 2026 04:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788348863; x=1788953663; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wBtWgev0V7JTZ56LWwg9bDwUw7OT4UvL1EjZvUIiNxc=;
        b=glqmNoyR43IaG7rPRI7Vkg+JgISWN6wWwmJ3oa/VcTAgyVHNGmZZxoPdAwrJNneLkP
         PcXFccXrbrmt6iZTJ06zvO0gs4pFiNUjb4+5JsWWYKyS0UDR5NKTZt5DIi4bXAZHYDaM
         ZvRbeo6BweCLa+gYv5cTdWH2H/RY6gCyENp33O0KHNBD0IllSPJHcuc6RWLC4RfLqSQz
         xwYqZ03L87sVAmV8xrjH2JRJCNkex/rf34appXOn879lG5hLyq5DaDgTs1ma0RZ9JkwU
         K1oMdqfo6HcA9sP4pfmM1k+NYLPSRHjwbN/OUKvKjTd/bWe5IP1chZRtOc3471b74Ack
         uE1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788348863; x=1788953663;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wBtWgev0V7JTZ56LWwg9bDwUw7OT4UvL1EjZvUIiNxc=;
        b=rM+6mPd+VBCaUhOPLJCqhMg3S7iKR0DsdYIru7reiP3Y60fVu1sgfAIi+olPPsIEO0
         SXXeYU0SrDK4mswqQQeZFmcdJvAMetC7KjAsM/2EaA9s4d/wznorzT3h5FzJ6TB8Xcaq
         kRMSIK993bAKemvu6QPzkeIi4hX/9ZqsBLeg9GsdsgeVfCWug2KqP/50JHntR0Gqmy6K
         8MA1Qfqb3/iAu08O76jSs011S/BJgOXiDq9evAT0qw+UzQYkANC6grCYY8YDwr9AivbH
         zg7UymYfpYJM1XlY+uiw54rCt9Aqge3ldrkPYPuCiyvpf07DemjZOiNA0o2hMPq+jRjU
         8VBw==
X-Gm-Message-State: AFuF++l5am7O8LikqemyyMJouwDRGMvqnedBn9PkVX5t+bES6hs3noqS
	iqWin23vjDHoNUjFZpylRCU+nOq10P0adltNMVCwY+2qoQAYxyXPBdV5H2cIh8jUqgHC/W2JyWv
	wIaokJtOc+jOJN4sFPfnkRddRWgwu8NjEqUzvnArAFNSbjO8ArHjZMSVL1uLrO2TWrVTRsyg=
X-Gm-Gg: AYBFou2g8QvOvWiTJEeLIPaaRlgLcVheL2N6BLVfgcbMxgyPTf8VN7ksuaRkcL/JKjC
	D3nEM91OyKv2+GZ7jcCa87YZ53gvZJ1cRtTAWLTtgQOeh8tM2Z11e/CY9NmKCN9Fz744wUZeiDp
	1/FP73RrBo1gf/MLTOaa5AceQuSYaBJ75ndHihWSqP7GSJRYNcuCBbp8LH8F2ysHUGPhRy8zzMO
	dEigeX+M672oqortTgB6aktD7ZVp8bo1SK+hjChr0I1lL7HQQCAYh3Oe3Dynav/Wu16Cs2A4uly
	dsDzPu1D23Vi6Ojmfn7wmNbCI7gYEFG9S3hGCykXyfyCqILu9snfpmfJBNgBoq3FYXDipxqk/31
	w84Xx37m7C8vVPyvRHLICBWqYaJiqFjim2Z9vbwB5L0LntnCSN1c/+CTkr4RMkRikMd3sX/gBff
	wrJJUTabZxqwvr
X-Received: by 2002:a05:6102:3a06:b0:781:9922:78f8 with SMTP id ada2fe7eead31-78a1f34dd1dmr1474003137.13.1788348863294;
        Wed, 02 Sep 2026 04:34:23 -0700 (PDT)
X-Received: by 2002:a05:6102:3a06:b0:781:9922:78f8 with SMTP id ada2fe7eead31-78a1f34dd1dmr1473984137.13.1788348862870;
        Wed, 02 Sep 2026 04:34:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b606b1cb0asm529648e87.28.2026.09.02.04.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 04:34:21 -0700 (PDT)
Date: Wed, 2 Sep 2026 14:34:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Stefan Binding <sbinding@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, patches@opensource.cirrus.com
Subject: Re: [PULL v2 linux-firmware] Add Firmware for ASUS Zenbook UM3405GA
Message-ID: <s7ufvb766iavg3gc3dfxrn4o5vxlazehg7nbalbabzo45fgljj@imvlofriwik7>
References: <109de689-dc30-4c2b-9552-74a85fbdbfd4@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <109de689-dc30-4c2b-9552-74a85fbdbfd4@opensource.cirrus.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDEwMiBTYWx0ZWRfX/fV3rEA+WC5n
 VMipbud47RDoa5COAZUV6LIBuSFWpaLC3ItfGmXDMGajF9xV9ZMifzkoZbwGCJsNAMvk5F05z1B
 HwL8JSkciSrwlj3ndz+7g6vKWZp2tY/Kooz0Y9Isy6GH/T7xYbRyccfrXq+BmGSCTZAYt1hHDgM
 l0IolHgxeR2WAXohPCM1oEKQd78m26zkyNhqaqyVzPuwc2lX/ww7BOkeQgfOhzAilzCmt9NyTEs
 6SF7in/oYcwucoTAXnp1HgcsRggHiuTR/PAG4vzU02vYH6Ca1x2iJSfD0DAVrEJN3MsTLO7HxFu
 O0efxSXcm49IRoS4ab8ssJK8eTx58x9ZRLpXIqVHkYD31j+2ZuPonOuNi4CsJMtM1R6QoYXlxW3
 xCaDnc87ZDQ6ANoySgLHRiAzxG6cgXIg3K5Sgc5HG22uWx6oV/s5O96Tun7Xqmr6UDx2wuK599m
 tw+/ME9UYmghDXuyCBQ==
X-Proofpoint-GUID: E9hDpLdHbsRsdlGa5O5avq6z1nt77HSi
X-Proofpoint-ORIG-GUID: E9hDpLdHbsRsdlGa5O5avq6z1nt77HSi
X-Authority-Analysis: v=2.4 cv=Re6gzVtv c=1 sm=1 tr=0 ts=6a9809bf cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=p0WdMEafAAAA:8
 a=EK3jA67uqf4qXxba5AwA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDEwMiBTYWx0ZWRfXwPxDrEBWdmGL
 8KhcMi5VKQGrDMF1kSOExrUTqT6BzYSMta+hytYcPiaV4SfRr7VV46k+4UfH2vOG3667menbU0+
 mmrVLUO0DaPgAsxQ5RD/X9nUmyekECU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_02,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020102

On Wed, Sep 02, 2026 at 11:57:05AM +0100, Stefan Binding wrote:
> We would like to add firmware files for Cirrus Logic Smart Amp CS35L41 for an ASUS Zenbook laptop.
> 
> Changes from v1:
> - Fixed path to symlink

Thanks, merged and pushed out:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1213

-- 
With best wishes
Dmitry
