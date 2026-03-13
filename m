Return-Path: <SRS0=YDjz=BN=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA04A106FD89
	for <linux-firmware@archiver.kernel.org>; Fri, 13 Mar 2026 06:25:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B4D4CC19421; Fri, 13 Mar 2026 06:25:38 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 368BCC19424
	for <linux-firmware@kernel.org>; Fri, 13 Mar 2026 06:25:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 368BCC19424
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5tgwX1176553
	for <linux-firmware@kernel.org>; Fri, 13 Mar 2026 06:25:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TXrdpy/WIHE2X9P4Q9q/hAK5
	sgWHGc6Eec29rzkb/Q4=; b=JGuTiW7oyEus9gB2vM/Q29qihLHd+FAGe8PrXJA8
	fkZWJuX4MLEJkbxqiJOD8cdan2VsPx+t9/defMvDRePBWW9Qix2D+qwxcfBPII0H
	wAKXqe+pLD4Ma2W5SP7pdRqmh3hsBSXYVCTYAtO4E1HURQjjMvs7hFS5JPTNu7ot
	FD8VWnk20H6rpG0Eodu0vehkiA50jQPEfe5duCWuYBFIYm45Rmut7ofJqd/pTfYW
	WfY6p4+CjRx8aCKjC6ZlvxcH3DIpd6fZmLvV1zMqQICcNyIAZFqYcnxXEz0R/mHE
	2iDJJb46xwWtWnTsoRfV8S4vaziNJrkqyjZF+mkAHP6rnQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cumvqc6aw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 13 Mar 2026 06:25:36 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd7fc27cf7so1026716285a.1
        for <linux-firmware@kernel.org>; Thu, 12 Mar 2026 23:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773383135; x=1773987935; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TXrdpy/WIHE2X9P4Q9q/hAK5sgWHGc6Eec29rzkb/Q4=;
        b=U9R6aayLdBv47pyDOg0QgpL+iy8RD4x4QU8jLkqGVsB5+OgBLwJIInU+QSW58NnggJ
         0PZb0Cs8+m/1hDhEHINbeGPiyDiXKBVgAs/wIy3PH2yUzU3wlPWlW7LTya+cpOB651hO
         sUWZ83Pn1eQAff3VNMTstS46/BVWoOYwSoUR+IAKwfAPuGsjjJ0I0mnpbKWT3tyjvGzA
         i7Q3EKyfvYj75kiqfQYBqDZeW+uvgEa8Du39TQwAGIIQlWoFCZlHGlO6M69RPQ5gRH9F
         3q9atV6vR2evpfBRSimrN1xpQp9RhUcbw9cFm1+pl647t0ObvZ24Z4WYHdAiSKkjQiqw
         sn6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773383135; x=1773987935;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TXrdpy/WIHE2X9P4Q9q/hAK5sgWHGc6Eec29rzkb/Q4=;
        b=dyIbTb+SJlFpl7xdYtHga0Rpjz7Bqwr6ZOVS96wYY4KevTBUbYPQhocBZMJKdPFSsl
         8SyrYtVbuNJzuR6HtPLOlpHibm4vLgQ3Lsm0Z3lb2w1X9V2+OBEXlLuN+pGB0sjZbGNO
         vcxHpotExown8BoV5sqoPzzSPoMsuYN0ng5K9n/llc7oOVPEzPTq27qeYaB3VDWHRVKZ
         moOBBFshDTL9DK0pWzTVFxG9JgYix3GdkSrda2DjuV5zdoToCGnrI/jJkG1X9a5SkqeR
         3f2YqcovaDq2uLVUX1Eh9mTHau60eZmXu12D1DRc/qChkAE2OzVkCbJIgTUjdsuTdYU7
         GHug==
X-Forwarded-Encrypted: i=1; AJvYcCXCs+H52vXpCbFda0jJynSaDbsNy3WyHlfCiPSyYiYoFrA+yQXXzNyj61+1Xlsc/qdEbeEPYn5P74IvfixqHg==@kernel.org
X-Gm-Message-State: AOJu0Yy9U3pe5bdxtY9FFTkcLgFceDl+3yzfjZgXm1T56MAMFh5YHRw2
	QslK8Gd9nI//34hcXQ37z5eytgNXR5FGDmCy+Pb3KywnxrjCCulMkxyy9WqP5tt1KnMoJAjaknL
	haM1SekVNe154QkjBs762FIuI9XPqcevNi3U72AxDRSY6c57ARQjLAc/C+y0acFw=
X-Gm-Gg: ATEYQzwqyM1HFOKOrjF1+lG2IDE24JPp4yPN9T1RSNYKbmQqYuEcPrLVDKwDPmfP0qB
	9Lfm3PkHZvuIHWsO6JKqcXBepQqDYYOpE0c48jMPNFTTkVS59j3Wgzqq3OaT0ElaHb+VSGc+Hag
	BOlc6L1Vu3d2MtOd1+BXAHY01Rfegs78WeXvUUjRYrJ+WbwS+c8Il/xOecVzCogwy7zCE3ME16D
	Tyiu0qBTfdw9y8zO6JieacvVjjYcg8JYlIyPtZ7AG1V3fBLxjD4x9iz02g5Pw7MA5ONZ3nFl/su
	ZV5ULB5fBidEaTERNjf5HUIcpUkojaZwyPGyPR0s+f7ymdooOvYKNMEQSq3WXgWUenu/VV3xifW
	HpRa1Om+cR9N7Y/i3hLdUZjNZhE1SEIv/lcehQ8YV+ldxLk+5DbZC2+2L8oWD5Zo8j94Ai78SDQ
	kJHlyy/ZviIMRPW2avLV+JxHBqSHQnzwoFPD0=
X-Received: by 2002:a05:620a:4111:b0:8cd:75d5:543e with SMTP id af79cd13be357-8cdb5b6fea4mr312600385a.61.1773383135356;
        Thu, 12 Mar 2026 23:25:35 -0700 (PDT)
X-Received: by 2002:a05:620a:4111:b0:8cd:75d5:543e with SMTP id af79cd13be357-8cdb5b6fea4mr312597985a.61.1773383134902;
        Thu, 12 Mar 2026 23:25:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e7dea4sm11787371fa.46.2026.03.12.23.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 23:25:33 -0700 (PDT)
Date: Fri, 13 Mar 2026 08:25:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: JB Tsai <jb.tsai@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: jwboyer@kernel.org, dwmw2@infradead.org, ben@decadent.org.uk,
        Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
        linux-firmware <linux-firmware@kernel.org>,
        linux-wireless <linux-wireless@vger.kernel.org>,
        linux-mediatek <linux-mediatek@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Sean Wang <sean.wang@mediatek.com>,
        Michael Lo <michael.lo@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>,
        Chris Lu <chris.lu@mediatek.com>, Quan Zhou <quan.zhou@mediatek.com>,
        litien.chang@mediatek.com
Subject: Re: [PATCH] linux-firmware: update firmware for MT7921 WiFi device
Message-ID: <3v4kz62swpdorijfdfza2vro75mafluyy3nux5ldjopqofqecg@t3w7vu4glmug>
References: <20260313005616.2853492-1-jb.tsai@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313005616.2853492-1-jb.tsai@mediatek.com>
X-Proofpoint-ORIG-GUID: 8Uus-fK-njkVB-57RzBp-t0kDFMh8zcG
X-Proofpoint-GUID: 8Uus-fK-njkVB-57RzBp-t0kDFMh8zcG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA0OSBTYWx0ZWRfXyndC4voX6ERX
 lyFlKsk8tJXFu+UzG1yl0EBfyDxkA01qFAExRLmIvNSLkrnTlGhRymHag4/wfonKUvdc0WI0b+p
 SFGXhtrV97jntl5OoneuYOXohmbQKOF3eoiAJxd3p5L1mQlb+ctK0uze4FbOxNHcc0w4jBsakgx
 iUI71KKBu98MroCKRLgWTaj+ZyCEixmeNn/o6a8ivsg+Lf6O/tRnc8GLDSXzj2zwfWKq7yvnOQZ
 JtlFEZCP0pNnaQc1xqHD6lJwiIXnvN78CXiZ/DLA0bbSWuLLbozbYHIvZnohZrOdajefu3ZLu3o
 aLvoI2wn+vyrDyZ1aUufwFxl0cDbqOPPy3abemSdVnUNpq4/DcAAjFu+INsULL3L4aYNJnb9ujO
 Va/Nui8I6ng6lG7E3GyC0ED74+Gk0edl3rXoEqm/0b6yc9n4FyhEunqOfCIds+YctNweaX3hQiD
 xhbbYmM+fVgkQsJTh6Q==
X-Authority-Analysis: v=2.4 cv=ccHfb3DM c=1 sm=1 tr=0 ts=69b3ade0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=p0WdMEafAAAA:8
 a=mpaa-ttXAAAA:8 a=emzX2egCO8hrsF3yLq8A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_03,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130049

On Fri, Mar 13, 2026 at 08:56:16AM +0800, JB Tsai wrote:
> Update binary firmware for MT7921 WiFi devices
> 
> File: mediatek/WIFI_MT7961_patch_mcu_1_1_hdr.bin
> Version: 20260224110909a
> File: mediatek/WIFI_RAM_CODE_MT7961_1.bin
> Version: 20260224110949
> 
> Signed-off-by: JB Tsai <jb.tsai@mediatek.com>
> ---
>  WHENCE                                     |   4 ++--
>  mediatek/WIFI_MT7961_patch_mcu_1_2_hdr.bin | Bin 92192 -> 92192 bytes
>  mediatek/WIFI_RAM_CODE_MT7961_1.bin        | Bin 791908 -> 792036 bytes
>  3 files changed, 2 insertions(+), 2 deletions(-)
> 

Thanks, merged and pushed out:
https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/957

-- 
With best wishes
Dmitry
