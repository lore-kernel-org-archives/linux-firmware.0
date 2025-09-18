Return-Path: <SRS0=8enH=35=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3002CCAC5A0
	for <linux-firmware@archiver.kernel.org>; Thu, 18 Sep 2025 12:18:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 065B3C4CEEB; Thu, 18 Sep 2025 12:18:56 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 161D0C4CEE7
	for <linux-firmware@kernel.org>; Thu, 18 Sep 2025 12:18:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 161D0C4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58I5u93g017663
	for <linux-firmware@kernel.org>; Thu, 18 Sep 2025 12:18:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0dx5smM4VIbs1mh41qvk0N1C
	2qCrLB2WDiIIYQ9Mz5s=; b=gWcPcFGRkU7ELM4Jv8Xe6nu8ueDIhtwiyidJZWQ5
	vAXWzrGZLcehzvcNPojNHtOGTVl54/6DvbKV3W/qY7oDH90wNdCVAuTO1QGo5q0C
	NbI/6v//vqYcvxn900tpkvuvqVB8dOow/fSOi/l2G4ZeHR7gnb8jWjTd66eNtDHX
	ViGBO49n1Mov6SmL1LemZvAlyreZoBALY5Jo3g/erBmSeh/212rFjp/9jw+y4cuw
	6CHLUhtRWDNldXqZypPqZVEo3ySeeqBSbVoiqlSx8jD4c9d/sRk/7cvIGI9gSWeM
	wmeG1IBKjk5JPrHXSZo2tbTH7yZcX1DiCtUZ8oDu3YM7tg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4982deasuu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 18 Sep 2025 12:18:52 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b5f9673e56so16277541cf.3
        for <linux-firmware@kernel.org>; Thu, 18 Sep 2025 05:18:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758197932; x=1758802732;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0dx5smM4VIbs1mh41qvk0N1C2qCrLB2WDiIIYQ9Mz5s=;
        b=dqGUNl2b+9qWQOuoC9G6kIErtSqFLn8pDPTruMQPHqVF7j2yFaLbqkpoDft/OIZyYk
         AfsvDnvUYLkoj+HQsoWG75Z8m/JZ7hmcq8nNzNHVnIiNVvx5mMsnyTalFPvZwdM//19c
         MVirLdgSxr/FFBs4zND/uK7phorr4Qr+KddwzeB2YbJsRc6+Si1qcIPy+WY9/HXpELpc
         Mm8hmje0WEnIjL9I0NIv2EnirOm/0sLqOUZtaznbvwo5pqK4Ikrxgie41iH/0NfMYDD2
         WKNQdbcpoae7RQICaea953l7tAssmu0aefUpnp6aMhphDxnCkkFCTswEZEjqthfeFxrp
         hv2Q==
X-Gm-Message-State: AOJu0Yyuq7lZ89NW7tcFKg07myPS99S5ykyMYk8MTC2vGp8QNWvklVcq
	uchPWR6M47ytN5nfdW4IlyavSYx22pJN/7wGWHm1vU/P8hPIGFyq/bSBnDQCF2Npd/4TxvB1IP5
	saXqgYkWgZwXMDk3sa6ZwwTDofhKrIOMQLNcEEIkkZuCLKTKCznhAHP/Fsl/kYLw=
X-Gm-Gg: ASbGnctOlF2RtBfWMjKZHRjHyLtXAIVXfnLrCferZqLVbIbfF950Sh4HkumE+Tvn/V6
	mtWErG0HjgWKnK9dw5CeUPTevE+URa0ih/giLlKrRl1aWnMIZHVJ+HazB/isFGnjJupJIxas12M
	9mVapI+82V0tA8IXXbmALypcy+ideyuVHyxpa3qLl1jMmHMvoS7aODnASxZyK+CaCN2UPJ2gP5D
	ZPKJzFTtCnP2HzuwAB77gDLK555oKV7cESkRoAsBBe9q/APn2PM9O2CAHRzd2EyltMYkY5DjiWg
	s4WzYDXm6dALqeRtZar4ZTIWuWm8Z3Sr+KwOIExpwUIGL2gpnvXfHpNmqYmT+xdp9my4QbZjA1f
	wGrV7Iaq5n1fuHUa12FSeAdYuzPchWHcB7DpBKT9Q4WNxgt3h1rTu
X-Received: by 2002:a05:622a:589:b0:4b5:ecc7:426c with SMTP id d75a77b69052e-4ba674c8ecemr66434501cf.25.1758197931642;
        Thu, 18 Sep 2025 05:18:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5qAmdKyiYzUAvUPDXTO68QNzwD9tubpcThE9BOa6UEQN/ke1FDbToWECCGW1uhqvzwGyFGg==
X-Received: by 2002:a05:622a:589:b0:4b5:ecc7:426c with SMTP id d75a77b69052e-4ba674c8ecemr66434141cf.25.1758197931031;
        Thu, 18 Sep 2025 05:18:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-361a1e07d2esm5506871fa.14.2025.09.18.05.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 05:18:50 -0700 (PDT)
Date: Thu, 18 Sep 2025 15:18:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, ekansh.gupta@oss.qualcomm.com,
        bkumar@qti.qualcomm.com, kssb@qti.qualcomm.com
Subject: Re: qcom: Update DSP firmware for qcs8300 platform
Message-ID: <zzjkhxoizdb3cukpqqlrgkrwqrk2cgmsuc3bnjrq334pn2zxzz@hwqba3vx7lu6>
References: <fa431a1e-75a9-4c89-b790-81368f30733b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fa431a1e-75a9-4c89-b790-81368f30733b@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=YfO95xRf c=1 sm=1 tr=0 ts=68cbf8ac cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=qC_FGOx9AAAA:8 a=EJlnVTegkIrerATOWWAA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: kH-NwRGfeeWX8vixrILQBlajXpee2dtT
X-Proofpoint-ORIG-GUID: kH-NwRGfeeWX8vixrILQBlajXpee2dtT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE3MDE4MiBTYWx0ZWRfX64KSfeE/k79r
 wc5e9TrLtT9N428y3kIyhFHU9JlE7eW7IW9m11g39fUYX4k+2EviVqKOkvVyD8mRsf25/Txc9lN
 ne01e/2fQam7bjrwkePyLimtLJGQ2hF/hgaKP8yHqKwQJbfiAHCN5wjjuSMrkULwIv3IbepLcbw
 vFisDSEB1FxORo0tPPNu6nSXZaxxLlU/ID+erBsAzP/UNbclu34EjN1A2px5AOZ+zMWzc6oo2Jb
 ZvA2xim7JBoVArI+EsSseEZuSk5/MEHyMa/1ihjfkbAxIiOJBlfBlnzWCWOp/YPGdJT2/fuHmD4
 KvyvKHZ8jnWwNGw+yfTxBcXykxDLAlz3Webs5k8hPcaHVZLOj4CGP07ZzoKk5Z6ncVRsuCFE3L0
 sxr351rs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509170182

On Thu, Sep 18, 2025 at 12:09:32PM +0530, Venkata Kota wrote:
>   Merge branch 'en8811h' into 'main' (2025-09-12 14:23:45 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> dsp-fw-qcs8300_1
> 
> for you to fetch changes up to 36da01bec9809f7bd96594db4885a86c286e90a9:
> 
>   qcom: Update DSP firmware for QCS8300 platform (2025-09-18 11:49:22 +0530)

NAK, you are explaining what GPDSP is, but you are not explaining what
and why is being done. Why do you add Audio PD to the GPDSP?

> 
> ----------------------------------------------------------------
> Venkata Kota (1):
>       qcom: Update DSP firmware for QCS8300 platform
> 
>  WHENCE                   |   9 ++++++---
>  qcom/qcs8300/adsp.mbn    | Bin 6643712 -> 6684672 bytes
>  qcom/qcs8300/cdsp0.mbn   | Bin 3084288 -> 3080192 bytes
>  qcom/qcs8300/gpdsp0.mbn  | Bin 5832704 -> 5873664 bytes
>  qcom/qcs8300/gpdspr.jsn  |  22 ++++++++++++++++++++++
>  qcom/qcs8300/gpdspua.jsn |  29 +++++++++++++++++++++++++++++
>  6 files changed, 57 insertions(+), 3 deletions(-)
>  create mode 100644 qcom/qcs8300/gpdspr.jsn
>  create mode 100644 qcom/qcs8300/gpdspua.jsn

-- 
With best wishes
Dmitry
