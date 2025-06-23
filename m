Return-Path: <SRS0=EIsd=ZG=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AA90C7115B
	for <linux-firmware@archiver.kernel.org>; Mon, 23 Jun 2025 13:42:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 769B5C4CEF2; Mon, 23 Jun 2025 13:42:29 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6EAEDC4CEEA
	for <linux-firmware@kernel.org>; Mon, 23 Jun 2025 13:42:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6EAEDC4CEEA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N9OOC1020680
	for <linux-firmware@kernel.org>; Mon, 23 Jun 2025 13:42:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Gx26PYr5FszNVb5fqWeM0afp
	3EaivHgHOGqcrYTirZU=; b=FNN6w70qzHmXGIIAlA3eKzNdED3FN5MSeKcBjpdC
	pIHIPnh7axOxpxGNMaW5zx5J+TOZNGsKqydZI3mGAs0zRTkXu9ELE4cToa+OTpwZ
	oVca2jjs8V4R4c5kKL9YPJYXOwetNEvcd3DfPeSPxFfBESzjBq7jn6sR56V7HDHM
	S9DFO3yNW7aMnzakFD35t8F9xG4GJ9g/OMcwKm4cMR2P7QWYsyvYqbB79ktYXQby
	GPZ3RS0f3fOSvEWFooyg2NYD5TBjmzqO53+fhAWBh2CNAysiTLcGaFR3aqMYPz1i
	MgTOduaqlvTAMUcUSIi7vo2s2wQVZUY5x4l7RY7UWzVDjg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47eah7u2xh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 23 Jun 2025 13:42:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d3d3f71813so601653785a.1
        for <linux-firmware@kernel.org>; Mon, 23 Jun 2025 06:42:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750686146; x=1751290946;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gx26PYr5FszNVb5fqWeM0afp3EaivHgHOGqcrYTirZU=;
        b=THbjkU34sy3EcceVWJ97pIyXJxEgwxXx5ZyHsHjJR/wW+fFBAsNrWLAFcai74J2LT8
         tog6iI5DNsucxwwd+wQ3q46iLrmDXKUceLJb+Vr7nG3UDCaAjK78XhQ9eEjZ3ixBDw0D
         pIV72wmnfuBg/j7WlTxqCkK0EmIRu9QijdDMMgzZkg2pob5DuruhB6TErNAlvy4E/ph3
         mK77yvc3kmWW8srgu9QbpyPmONpU0PM2tkTXVY/uL/hFLFPyI85xVa3XBbPI9Jsy4UjF
         Hesc1xNpspnHZS14dCeup7mMBsWG+KD0lL3HQ1brZHt3fYb3rCW6tqOfJE6c3P6JfTKs
         I29w==
X-Gm-Message-State: AOJu0YyHtMH29OzdmnFrpXlw8IKshYtvOLFepJoIYC54eck6q2MoXJEP
	GMEnYZn7BFQo9bmImbxNKv/5xv2cIoZevQcatu5RDgSCorocChX3QxaoEE7sR1Iwaw+pqb3SiYA
	STKQF1xa6zVdcPBcSeXjk4uE710sawdoDOH7QwbqGI9gPP+LZYDJR6zNaVnON50I=
X-Gm-Gg: ASbGncvJwqcxctJJOeOUxNKuyP+PEmfHScegOchQyNOa2DnrLxK9ehMvKyN/dGfH8ap
	Gpyo8Crwz7SPu1oUmisW6NNZOPMd/nObxatMmYQ1BNwVjcnMBNjtJTaTwc0Y+Tf6/08uPjneItH
	+bL/mBi0GhhH0Gh3BKsTETacEk6gyQUvi9a1GSPOe2Rkt4FR8BP0mFrx1RaiHq2on0cKpgEMocq
	T4GXGtsrESnqseTWJvBzLuvyGnIGCAVEwuD3iIiAY16W52JbckDjRWpMJlu9IXHAEWcF2T7SjBd
	F1Ip7DV0xKWaLdX8i1GJ8omf6w4rLvWfykSOxQ/zsCGcg6f9npc2VG5SyhgpADdYeAXodMPXa7u
	MoUXqTmm53wxeEskagxm+nF00wSQuLU4aZxo=
X-Received: by 2002:a05:620a:1786:b0:7d0:94c8:c1a4 with SMTP id af79cd13be357-7d3f98e5fdamr1705044685a.23.1750686146230;
        Mon, 23 Jun 2025 06:42:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEfYM1hkwjSrpZa7kPiB/YvKO+rPXtPInqF/BQqM4uG960kER3e3F+k6BOT5AQI1MwhqUin+w==
X-Received: by 2002:a05:620a:1786:b0:7d0:94c8:c1a4 with SMTP id af79cd13be357-7d3f98e5fdamr1705041185a.23.1750686145762;
        Mon, 23 Jun 2025 06:42:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41446a6sm1401684e87.19.2025.06.23.06.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 06:42:24 -0700 (PDT)
Date: Mon, 23 Jun 2025 16:42:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Slark Xiao <slark.xiao@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Subject: Re: [PATCH] qcom: Add sdx61 Foxconn vendor firmware image file
Message-ID: <xlredaznmv2li7vs4vi5dze65d5fhbff4tvvsjcraltmrs7jx7@vdj4n3u2zu5f>
References: <20250623115444.12870-1-slark.xiao@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623115444.12870-1-slark.xiao@gmail.com>
X-Proofpoint-ORIG-GUID: edR3Q3FdcXT2GB455sBXyOk3snAzKxoq
X-Authority-Analysis: v=2.4 cv=PpWTbxM3 c=1 sm=1 tr=0 ts=685959c3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=RxDWUE5wtfgohxTCHOgA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA4MiBTYWx0ZWRfX4tKiUfxnRLVf
 59el2Gww1XMMTw2fBbSKd9So4dS/XVjLMKeMtEl9sGNgFjzGBHKhZbmbexpkiQ6AuD2/djHbNFI
 SW0QsU8nCOCq0n45SMCXCw6IfCObi/QPN8lY17dJa++DDT0/VE9Co4nVKrLbsg21W/5eSiIMWG5
 yynA4aLasSEwawIYr8AwGXIJHy4RGpq6JOzZevoZmPI0D2v9VpSuy/FH5NzgM70nmhtDovyTHb+
 6CSI8msM34gRoxRJjPl45nO3qrVq9PWijdK34+jcPme1UtZ3TgsvP2cEeK+2oA8bONYZj2lZfXy
 WByK3vLrvY7HzEbDoyYEkYgcy6AV7xMB3x34WI7GnATb4v/MLO7kjN/F8RSLpycdyaVEKAXZc0D
 dzxUfORyv+8SWeSMbodJwLIFRJBp2zdTG8BTfDJJXK0/JAse41n5ETm61CQGm0SIano/W7Xp
X-Proofpoint-GUID: edR3Q3FdcXT2GB455sBXyOk3snAzKxoq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_04,2025-06-23_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=927 clxscore=1015 adultscore=0 mlxscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0
 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230082

On Mon, Jun 23, 2025 at 07:54:44PM +0800, Slark Xiao wrote:
> For MHI modems, it defines an edl firmware in kernel drivers/bus/
> mhi/host/pci_generic.c file. According to the requirement of MHI
> driver maintainer, we shall commit this firmware before commiting
> kernel driver support.
> Since different vendor use different firmwares, so we add a
> vendor sub-folder under qcom/sdx61.
> 
> Signed-off-by: Slark Xiao <slark.xiao@gmail.com>
> ---
>  WHENCE                                    |   7 +++++++
>  qcom/sdx61/foxconn/prog_firehose_lite.elf | Bin 0 -> 663552 bytes
>  2 files changed, 7 insertions(+)
>  create mode 100644 qcom/sdx61/foxconn/prog_firehose_lite.elf
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
