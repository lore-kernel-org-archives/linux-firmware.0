Return-Path: <SRS0=sA9I=4X=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3AF7CCD18E
	for <linux-firmware@archiver.kernel.org>; Tue, 14 Oct 2025 22:15:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 99164C116C6; Tue, 14 Oct 2025 22:15:18 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 83020C4CEE7
	for <linux-firmware@kernel.org>; Tue, 14 Oct 2025 22:15:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 83020C4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59EKRC1X032641
	for <linux-firmware@kernel.org>; Tue, 14 Oct 2025 22:15:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YnKbVvUS5M7j57vHLm1nhksQ
	fP9D4NmLIohQZPrSRFQ=; b=n3c+kpnvQyNZCQfnAWUV1UMXiosKXk1JDeI0QkiG
	rpn60UD2biTr9oXrAFoR1RMmdggaW7ef+tOO7EvDqq3JH5p7aWitCsKvYzDvRxMx
	ojY9tn4xgqfMgZNmlC6faiOlJN9w2rUuEbSsFW10Z/Upff0NFPk8/XDdYU80rhl8
	mi6nTMKXS6Gee9EObmp8JXjGnBvRr+SEyurAWvauHFhrpzYDhXCyLSVli3HIVi36
	sxzhDVmmPKCRExJG2IeekG8rMqJkn/k/YQdZloVzk+Finaquy0yfmiEriAmqpQv6
	JiPR9dzkP/DYD1u68Hs8DDx13dNIwZMo1HWABsHJnEfc0g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49sua8gq78-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 14 Oct 2025 22:15:15 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8776a952dd4so384583206d6.3
        for <linux-firmware@kernel.org>; Tue, 14 Oct 2025 15:15:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760480114; x=1761084914;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YnKbVvUS5M7j57vHLm1nhksQfP9D4NmLIohQZPrSRFQ=;
        b=E/bJIv+CPfJ7T6vDLXcZ8z2yR1cS53UXyb9WROfJrDdlf0+mdBj2DzHNeWkhtVB0T/
         qFeUHTG+SaIsNeZjvN8xULrdEhcyFQQjD2bValK45al3RC36Us+NryPZP2BOhX3mUTFR
         DiWrmyAljTnUcHitBG+UoZNvbk+mkU6gqZpeS9UURBByO+3kFYMYAV/BPq6H67dbyqfE
         sh0hZdp9nfvsdiSVivRlDUHk6EJlRcYOGROKH70ocOjX/KqkczgEiDNJn7eTvTBKdIKA
         YFQNYEMvkeSm9hKHlWME8ztcY1TsmAp69BPylRofz/etlSsBMq+88q/MYiwf+b5RbZqj
         XY8w==
X-Gm-Message-State: AOJu0YwN5Mxyke+TdG43coKVZTIadk1yqpKV1kGyxfgcyGyePmp45b1i
	KOhDogCqrxvI2JI+FNsRCynr2C4CD6Pb0vbXB7yht24E+Kcl5+Rj9PI9iFycjCeZcD/Myx4zNWS
	+g8E3Rcjg2mKGgh08yDQwCDNnahd/9qmTDAjNO92Z5vLXUNYIWayD1i4qS9+6Md0=
X-Gm-Gg: ASbGncumbUhjczEuTfC5nCzsVgFuiolyJqG/SKJLhrmx+FcI1rs9dk671k8RfyaPMxn
	fQlaH92yysTLy9rCEUR3MAAH8pdPYpjZ+1Elr4a9sXg09teHtht+kXemeNUlVLRpLyu6+dU/zax
	2bAZu36B3+napc3Ztl/rhk5Zpxnpkf2nMYqsztqzyaW2ZcCJDBJ5YAKnVciweeysm/ipmLg0ueA
	BK01zbfvEQWw+YecIJv+cUdM42LsMAi7uLOTzXNO8e1iDyVt8fubIHonwpqXp3rVgPIX+wXlla1
	/3lnFCB5S2tu/GM4TVykDYeRMi9pIgZTZiuKZjYtbXIpsMekCu0YTunygSgQWvqL77htApkCOg6
	i6V3L68M311mblA3/SIcmImlK2moIdfFQBaUHkNLX33mMsxQS4td5
X-Received: by 2002:a05:622a:178a:b0:4e7:1f00:2ce8 with SMTP id d75a77b69052e-4e71f003c6emr150274291cf.18.1760480113746;
        Tue, 14 Oct 2025 15:15:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuH4vSgflFeGqTL0KGsk3vsUoqdexKmJ0pRUiduigkB/mSDW+qHubY89p+aM/Xqpp4xUoMaQ==
X-Received: by 2002:a05:622a:178a:b0:4e7:1f00:2ce8 with SMTP id d75a77b69052e-4e71f003c6emr150273931cf.18.1760480113260;
        Tue, 14 Oct 2025 15:15:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59088563c13sm5605608e87.78.2025.10.14.15.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 15:15:11 -0700 (PDT)
Date: Wed, 15 Oct 2025 01:15:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Janaki Ramaiah Thota <janaki.thota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, hbandi@qti.qualcomm.com,
        mohamull@qti.qualcomm.com
Subject: Re: [GIT PULL] QCA: Update Bluetooth WCN6856 firmware 2.1.0-00653 to
 2.1.0-00659
Message-ID: <gkes6kemvonv45bppohspv7xqviv25c5do5awsy3q2wyzm3axa@mxt2bdm2toz7>
References: <CAPiVHHiGmwSb3L1P=qWBdiRMfM2kSgbCKkirsiGugTsPsh3TwQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPiVHHiGmwSb3L1P=qWBdiRMfM2kSgbCKkirsiGugTsPsh3TwQ@mail.gmail.com>
X-Proofpoint-GUID: u4WOnOFLixsfXQIv7Ko5ThjuKLqcMHYh
X-Authority-Analysis: v=2.4 cv=e5MLiKp/ c=1 sm=1 tr=0 ts=68eecb73 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=ufhf5gZa8PRL6YJeLj0A:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE0MDEzNCBTYWx0ZWRfX3xpb1H3om1pQ
 aD4Wu4wjrO59p71kTDQtdGnMVcvopXGpxsPGJKRgQjqr8kUtr0b7AsZ9binH0tQtKHhXHcOldZH
 rg2s2W/A1/9unvrAGQFEPgEd63STGTrTzQgX19lCmRtvd6B6acNqX11bm6KSWoE/xBARGl8U8BS
 BfSfks5Tzo8B10+kiw8RDF7MSCfg/9M+maz7GsZ1CxRRQ65o1dzvhIJtDa8BCneV11B8M8pqnnd
 o57hqn0Rz/RMjPrIooIFMEDPWjXjOdWaYvehszl1kjLBXqweBMOzGBuGpM8Ph0ncTIwbYGnwOIn
 iy6gu3auEnzJ4yoJD6F3NOucURgl06UdMo92FFilfX/gP+QtgtU4pLIadIoBs613dTHXekfaYtg
 nZ+iLT1lXNE/RYMnaJ5EQffC0EViHg==
X-Proofpoint-ORIG-GUID: u4WOnOFLixsfXQIv7Ko5ThjuKLqcMHYh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510140134

On Tue, Oct 14, 2025 at 11:15:05PM +0530, Janaki Ramaiah Thota wrote:
> Hi linux-firmware maintainers,
> 
> Here's a pull request for bluetooth firmware. Please let me know if
>  you have any problems.
> 
>  The following changes since commit 849bf4412342998d58ef902f3905ebee36e99107:
> 
>   Merge branch 'robot/patch-0-1760383836' into 'main' (2025-10-13
> 19:40:41 +0000)
> 
> are available in the Git repository at:
> 
>   https://github.com/quicjathot/bt_hsp_fw_2.1.0_00659.git HEAD
> 
> for you to fetch changes up to 12f59f02d35d87a76a9f26085ee2f47e678b68cf:
> 
>   QCA: Update Bluetooth WCN6856 firmware 2.1.0-00653 to 2.1.0-00659
> (2025-10-14 23:03:42 +0530)
> 
> ----------------------------------------------------------------
> Janaki Ramaiah Thota (1):
>       QCA: Update Bluetooth WCN6856 firmware 2.1.0-00653 to 2.1.0-00659
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
