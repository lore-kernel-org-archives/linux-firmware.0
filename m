Return-Path: <SRS0=ROtF=AE=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FABAD79742
	for <linux-firmware@archiver.kernel.org>; Sat, 31 Jan 2026 06:40:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D57B6C19421; Sat, 31 Jan 2026 06:40:04 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D5686C116D0
	for <linux-firmware@kernel.org>; Sat, 31 Jan 2026 06:40:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D5686C116D0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60V4eXNJ393249
	for <linux-firmware@kernel.org>; Sat, 31 Jan 2026 06:40:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zfLFnX/pj06+42VOeKs579fA
	r4gQfJugqfCbVka7R48=; b=gqe1TvuTQykpAnbs5syhyV19Zb0JB4DvSwyMCrZ1
	rXFdenj1qvete+UFM6GVhAF+ZGfa3lT0a2MxDs/bgjDM+FNN88BVqwFf3CsWVHmB
	Y57Rmn8/QONQhuLFez1LyzSnZYKngkJPMRQxgigpHjWJCnsdNqPoL5yhGSur58eB
	9d1bKnId1uQfRwR2iZbBOZ+T1gR3/EGdBBUsPs9hC/BQKWmL3rb0AaqDeDIKT/zj
	8Jq80h2yHDSudSYnPzQ/bXTZmvfGRk8+gjLj8XPpoj6+ckV2kX2H0lCRCCVQFExh
	P8YhLPBZTVrQXwKjfMq3GTiiZvHV7bChU/87fDDnRvuA9w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1awnr7y1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Sat, 31 Jan 2026 06:40:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70b4b53e4so1159864185a.1
        for <linux-firmware@kernel.org>; Fri, 30 Jan 2026 22:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769841602; x=1770446402; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zfLFnX/pj06+42VOeKs579fAr4gQfJugqfCbVka7R48=;
        b=gGnVSB3xWQ7+IkqSSx1ZThQdIuFg1gQJuFh6yYkNWVPaoFAUeLgUnxEAReQdeqp1Ev
         xlt+GXilU+yyNP4z2c4NEMX8je/ycwx4n0eYamea7iCL44PBpYclL2V4iVstTvXSpYiX
         qy+8ZfplKguDn+vuUvDtCQjZyxagImuWayk8jEQXTJ0ZwNvx4uXkTuG4eb5U3fb58rlR
         UW8SDP/Xrre1LSV6eLS1b2z5XtB2Tj4KLvjC8hJPBctYvc+HDTaXc51WnJZRvb2iUovH
         EWoo9PaYDUis+oieN8QPARJKP6mhG10zc0hGmpnAOlLZoVpaXd+0neMiYN1dmoF+AKKy
         u3cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769841602; x=1770446402;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zfLFnX/pj06+42VOeKs579fAr4gQfJugqfCbVka7R48=;
        b=EPKx4iNb7uKiekR6tFISkIAmpgi1D+J2xNGn2VmtqyoBEOXUwPZDLNhyLEDBd2wDHu
         LiyyvT/877Z+O/NFlSA19MdbkVVgolExChXiFVUTUhsQI0kG4SQqiutmsunTmLRio1Av
         h3pzrYtHwoAVUIJ2MVzsNprM3icapPyQV8ziBeCJ6KtF3ncyHawIJliChbCTHvZ2HRPG
         Kmv7JK8KgcItbBt6AG8XGe6ogE+0TmYh8LBKttlu4typB4pYR3jZQkq/S4C9GXlMxqTv
         Rg0bgzPsCqC5g5e0RHjVCgFgiTC1fmuISjmFItwL+YSkXYpJjnRg8LE48A0GYPlWfVxF
         WMxw==
X-Gm-Message-State: AOJu0YwFywi9YXDLcDgBez2EmS48qKrvOSVVByzd4xea4idJEWmjH8wM
	mhxGsBiTUPpbtIexkgih30uGkrflrasYHoDuV1UtkVBj+U+3BcIheKKj2s03WBW2TW45Htm6P33
	P34JfAb8nB/egEzAyKg40QztayP5802NLDS886MDrmgbetxiN0z2jhHXBxsc8HtE=
X-Gm-Gg: AZuq6aKAjWk1Tfj0aO8CYUFNTmBFOgUYQGeHdsQdbbu/2c7I/AhtHZnDEcEtTQVuDAV
	GQfiyEbXNEl1JSz3KS39886whb/VihyOo7HqWYTVjg3mwRcpeSI0FNNwpa/astKIxhxWaabL3qt
	shMg+vmxoGR41fXvDXLH5lOklvjgkWCy63pW/qtsdpJDK+QrmCYtfOj8zv0ZPk41erwIFab6IcK
	U+sIkMXjAUa2FLdxmTYTbP38FOMtddIbP8Uu6DA1sAN1rtxCxRp7DrMmFsXlTb+H+cfchLpg43y
	YGNVHmcSn2asxqErCOlSz/rslcmc7Ur5QIVCgFIb7XoewFamKuZVfj9RDl+F9kBlSJEAh5KyCGp
	Oy6VOq4seOcqU5dAYDdJxLbDK06NEj8uamoyoO2D3WgIb1fZbiMb54PJR2HvTz14uSqZ1kXyHlG
	/9YQKgAQ22sJy6Iz4heKSJDkw=
X-Received: by 2002:a05:620a:f10:b0:8c7:10cc:758e with SMTP id af79cd13be357-8c9eb2d3ca0mr723603885a.45.1769841601670;
        Fri, 30 Jan 2026 22:40:01 -0800 (PST)
X-Received: by 2002:a05:620a:f10:b0:8c7:10cc:758e with SMTP id af79cd13be357-8c9eb2d3ca0mr723602685a.45.1769841601226;
        Fri, 30 Jan 2026 22:40:01 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38625c621basm18212161fa.13.2026.01.30.22.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 22:40:00 -0800 (PST)
Date: Sat, 31 Jan 2026 08:39:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware
 ath-20260130
Message-ID: <34lnv35rbicqk6duyqhhidunulcipttsj6ryvzw6embgablnpl@gh3wtsknmcma>
References: <ecf412bd-7bd3-42ed-bea4-d7aa837ddcae@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ecf412bd-7bd3-42ed-bea4-d7aa837ddcae@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=MNltWcZl c=1 sm=1 tr=0 ts=697da3c2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gcp-Y-p2_AVPb3T4FLMA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: MnSxUDtyzudoyfrLchtKfzHBxBwvnEVD
X-Proofpoint-ORIG-GUID: MnSxUDtyzudoyfrLchtKfzHBxBwvnEVD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMxMDA1MyBTYWx0ZWRfX8MidDJN65F7n
 42KIflyzXJyQGktCnJ1Rp3b66Q9ENSIusGzOG4R8n16pE5w8o8FtDKt1n+zMCMg5zIIX9ifKWqc
 mOyNxpAL1zBjjDsiaMg+qcwRfTL4JboGIt5WAsN+cpHw47VR91uq0HKdao0d9NjRytp9PNbuLd4
 Jh3B3jC/cbTyYhtq7KCkB0OnayqRchfJiGgW2qyhe9vQt/F51/uL0QS/YcCo+Vi28IUu3TsCOT5
 2joIZEubkIBi3C6TIsCdXXqmBQOmmDOTyyfJFw0KfYdXQxBGh0kd9cK8jV8mg9WIHYoySJA4zRG
 rL+Ml2cS9mwWqhY6lvbq9rH99g/efk0pfzvZqoG6ZoA3hUydrw7lvKgX0G9INmKC0noXCKOKIuB
 cv5ih4E0OlD6WHmebxR+kvu3doo+TFmscYyBLj8ZLr2Nez2SILqTjJBB/o7b0LbaD+7h0VbqWK4
 p17TBZccZcvdNh40JTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601310053

On Fri, Jan 30, 2026 at 12:29:48PM -0800, Jeff Johnson wrote:
> Hi,
> Here's a new pull request for ath10k, ath11k and ath12k.
> 
> For ath12k:
> 
> Update firmware for QCN9274/hw2.0.
> 
> Update board file for WCN7850/hw2.0 to support:
> bus=pci,vendor=17cb,device=1107,subsystem-vendor=1eac,subsystem-device=8001,qmi-chip-id=2,qmi-board-id=255
> bus=pci,vendor=17cb,device=1107,subsystem-vendor=1eac,subsystem-device=8004,qmi-chip-id=2,qmi-board-id=255

These two were not a part of the previous upload, but... They again have
board-id of 255 (unprogrammed). Why is there no calibration variant?

> 
> 
> Please let me know if there are any problems.

-- 
With best wishes
Dmitry
