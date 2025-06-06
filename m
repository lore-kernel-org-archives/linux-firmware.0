Return-Path: <SRS0=FUZJ=YV=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC058C5AD49
	for <linux-firmware@archiver.kernel.org>; Fri,  6 Jun 2025 22:20:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 94242C4CEEB; Fri,  6 Jun 2025 22:20:34 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 90208C4CEEF
	for <linux-firmware@kernel.org>; Fri,  6 Jun 2025 22:20:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 90208C4CEEF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 556F9FqW026277
	for <linux-firmware@kernel.org>; Fri, 6 Jun 2025 22:20:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=z4/ryGSOQC6axRsyifIseQyG
	O05Dq3ASzrnt+WNqaJk=; b=lJs9085W1bJV9Y5jabla49o+Gj94NksWjTVy2btw
	HZOHSrwe9gnGaerdZUPWTc9aTto2oxzkFM/ESpFtVG6SMI/b+HlUAfA2cladz0/p
	AFiVA9Lh8Hon1EedFfuzCI9tYU6CL6AtYbUx6qUvF57Uzv2anBef4qnrAZK//xp2
	sY07KGvhcDx5Y06ZOLDQMK+ybL9t7E1BOmo1BwddWoUl9IBmk0lgWaCxgsQCbf4a
	7FiyJWeLfBSkYpdJqRYRUF4NmY1g9VLUQI19bhQMBNlG712vss+umw0FsDxaH+P4
	0l1LWhQWFBr8yHlolyedyAB2qS8uFJIwrfnc5siCoIQuPg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 472mn083s3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 06 Jun 2025 22:20:31 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5cd0f8961so454896285a.1
        for <linux-firmware@kernel.org>; Fri, 06 Jun 2025 15:20:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749248430; x=1749853230;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z4/ryGSOQC6axRsyifIseQyGO05Dq3ASzrnt+WNqaJk=;
        b=Xy5X6qTJWsEKvr4fz3RzwyXEDk+LeQmo7GCrfX6LWVvL465ooXD1fyh9c0ITXpJnHk
         IKnlbEBmV+Kq8tM0UMRwVfNKaDixJryNsdRxIxfmxo21UsviaAuTAarTYBMB4NY2B0KH
         dDVrVM4gjy+eYB1JgwRQUU7gRIGxqrv7rCLo29Cwg36WFn1ooGV2AA7vbclGrmoDi5Bx
         VkFnzet60bmF71H8h03UtKqXzpWAQ0gzjqjRIQXqCDcA1QjqkNhxMHBk0N+T0S11ywVd
         c7lmve2izgBE3IIynH4SJKDYmP+BA5vJ5VIjz7tSnTMC2OUc+7luW5AyHCII4E2iiuvq
         fhCQ==
X-Gm-Message-State: AOJu0YzXZ4Z+iK22H6+y626kFmOM2EsFutVEBGPyegIgBL2YEBOnkH0A
	ldItFLuUZjas4hN/ORor5idNMutei39wkSjPmH73CmnnMMm3Vp/OTIqfqjjAD9DRen/iLmryQBc
	E2ND1VySLUH0Ikj3RAdtyMz/IX7AXpcpZVLHvjMqSliKOZd6FU6hHW7MsQXfaVhjhWUfUe1IOJA
	==
X-Gm-Gg: ASbGncvoHKJJIuByZtQgVYxTBtYxJIKYrW5z+DP/XHUZKVjF8vSEPXu14wnM6hWK4aY
	tF9y296ZqaeVStC1MHMavtHYcdyeMaLmud9rMtSa2p4hJsg5jJ7CFgp283sbjo6W+0dHz+76Sid
	aVyaje2hC+rjc+zU2/6G4el8LHfYAao4ARKy2+YxUKS3duRiKeM5JM9RdiUnR5OWh81lRYs4la9
	Ba0fAoLZRHBmWL2nxSLRy/0rbASohBpr0GrFkhCCT0HpvXtjysM9mpvTt/4S8EuCNqOZ/i8AGTT
	aVyNcya1srUasysVjgyuWujj+U7egN8kEkKKDZuQ5WZKUuQiONxfhwX7s66+uOehAuPMxV4vaqK
	aPRgtsFljHg==
X-Received: by 2002:a05:620a:24c9:b0:7ce:be04:f838 with SMTP id af79cd13be357-7d229861062mr786776785a.18.1749248429802;
        Fri, 06 Jun 2025 15:20:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEb38jHJ/DWa/VVxz5UkrnElRyJNDekdu2WV8hV/vbuN+qyyFrWXQ9NZUvqz8wAO+wbJY4R1Q==
X-Received: by 2002:a05:620a:24c9:b0:7ce:be04:f838 with SMTP id af79cd13be357-7d229861062mr786773285a.18.1749248429404;
        Fri, 06 Jun 2025 15:20:29 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553676d00c0sm311615e87.22.2025.06.06.15.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 15:20:28 -0700 (PDT)
Date: Sat, 7 Jun 2025 01:20:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Zijun Hu <zijun.hu@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, jwboyer@kernel.org
Subject: Re: [GIT PULL] QCA: Update WCN785x btusb firmware to 2.0.0-00799-5
Message-ID: <nnqrkrqp5ig7nb5nw6nfxqqzsi234y3dvmzvjh5e7pzr2c2coc@y6e7ml24quep>
References: <9fa3184b-991c-4dc5-a719-13de57ab44fa@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9fa3184b-991c-4dc5-a719-13de57ab44fa@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: fEDedMFDG8tsh-p2j1da7pfPyypL3F1B
X-Proofpoint-GUID: fEDedMFDG8tsh-p2j1da7pfPyypL3F1B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDE4OCBTYWx0ZWRfXzc0L4VQVV57K
 8t2uCFIAXskxWzTljk+mako4FSjRio6zRoK4cQc/q2Kf307PdS94AIjKt/v9kjaZ3HB6D7e1DVQ
 AySBF6Z5QCQwkFdpcqTZxVZWK39eddsMT8UAzkeuAbmaka7CX/3gXiENsauWl4Uf2oXaSi+i5jV
 LTnjbGN9A5/HAu7VhLZiXU8G/9sGUzExgaRrDH2zh35SpMC/t3oWAgV/GpJ50qXElmkjtMLGR+a
 DFFslUyK4zZ53+aHXmxvUVOcNKMCCmlxClTtipRIaCGLhcMx0dft228/xZFpHAmBEWC0e4wlzBw
 /mXfRRPCevtgL8i6XHlHzLrcKi86yVyk1CWg2MNwY7dq47+0G7eE+Sw/L+wR+QydUlnbpzgypgY
 mwirP2Zc94XkvY19nkgkJ8GkoAZAVs0seZfXDK6XlwTBpaY3UgLuXQ6Ozod4FSYbbipH9VPa
X-Authority-Analysis: v=2.4 cv=Y8/4sgeN c=1 sm=1 tr=0 ts=684369b0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=jDvIAuZuXetJ-2A7yf0A:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_09,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0 phishscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506060188

On Fri, Jun 06, 2025 at 02:21:07PM +0800, Zijun Hu wrote:
> Hi linux-firmware maintainers
> 
> Here's a pull request for QCA bluetooth driver. Please let me know if
> you have any problems.
> 
> The following changes since commit 3b75d677f898fe2aacc7b11763bbcd4732e71ce7:
> 
>   Merge branch 'intel/update-guc-gsc' into 'main' (2025-06-03 21:03:19 +0000)
> 
> are available in the git repository at:
> 
>   https://github.com/zijun-hu/qca_btfw main
> 
> for you to fetch changes up to 57ed44c43b346ebba23afe1b4aac76ea1a4b8fa6:
> 
>   QCA: Update WCN785x btusb firmware to 2.0.0-00799-5 (2025-06-06 13:33:46 +0800)
> 
> ----------------------------------------------------------------
> Zijun Hu (1):
>       QCA: Update WCN785x btusb firmware to 2.0.0-00799-5

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
