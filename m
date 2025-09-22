Return-Path: <SRS0=tHq3=4B=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABF03CAC5A7
	for <linux-firmware@archiver.kernel.org>; Mon, 22 Sep 2025 11:04:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6FDE5C116B1; Mon, 22 Sep 2025 11:04:25 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 753BCC4CEF0
	for <linux-firmware@kernel.org>; Mon, 22 Sep 2025 11:04:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 753BCC4CEF0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58M91HE9017220
	for <linux-firmware@kernel.org>; Mon, 22 Sep 2025 11:04:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zf9KvIkshJGtgvTSRYuCnGHr
	QXOP0Iw+mC4TnO7dYGw=; b=TNyvhIUNiVQonyVyLUjdv5AUCpa27ULU66IFA3wF
	0QlQeVAZ9a14S2ruaUGaX16NHI9NX/pN1GbHV3/4voO4jJ+80iK58uY+SM6m0+r9
	mB5RfTlwB+Uizu/9dSgPL8BcXDtQDkdU3G1CQk+RpraltAKNpC5Z1HK1Q9IoH9ug
	+usVRMUfzGbUB1iMnRrL8/ePWpidrhLnnCfVxTUfRmdgtOF0tfo4ls6HBJuoac1K
	4bmGKgd5K9VGiHDlFIfT8C60/LGCWc1aww0LouYGodiA1K3HB9J1eR0j+aG96uQ5
	lCQw/p1q1OU6wXxj/l6FIWTKEE6/jzSNMIXrv76ilgQcpA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499n1fcd7t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 22 Sep 2025 11:04:23 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b5f6eeb20eso152699651cf.3
        for <linux-firmware@kernel.org>; Mon, 22 Sep 2025 04:04:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758539062; x=1759143862;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zf9KvIkshJGtgvTSRYuCnGHrQXOP0Iw+mC4TnO7dYGw=;
        b=ve7A+f9NEHv1SbAKBwF/WluM0fj5iF73RK1RBsYkHytrWAI6FDp2agFexbo220fLA9
         GQYL9GMKz49F7fOJSW6brCD9lrAFlzoQJ2hDBDTD4+8hUKMb54y99UlrCOIJ1a626TBP
         ikvJ9CV1IbxJwZnzW2YW7OaUbwETlKLVPK8zoVV3z15mfXt6JxuQZ0fNJvr3wGbU/CSG
         9TpbGs7h2KeQI6zVKONEVQbbXtU6/eY0Zs+EcYK7PBwMVDCCNOLQg/zhNwXqlYCFyGgw
         pUoFlyTzC47P39synEk0qTQjLFEV2MwgdsEeG3h1bahTeSNn4WAuTm34Pj6gxv7Sj1s+
         bWXQ==
X-Gm-Message-State: AOJu0YyqMz872BcnW5l2wDwaKOyG/TisO87XO8z2WkJrVME+cig/ySK/
	AOxfn6vpwD/wFnJLJxt3rSncoYgZS5k12dTr9cIzBkWn+feaYEWDCE7zdNmO0O1KTgAd7gn4hyF
	GbMnGCZWeT/9qXnpNwp3CJ8jXXrJAF5sEWHn1kMzyx4dOuoUnEDXpMrWu0K3L83ddg651nek=
X-Gm-Gg: ASbGncuENSUZl6HY37MBMhZBoMYt5rJiF6pA+sbe2FZkIiqlyBiUtxaPuD/XIW5hbF6
	dJzwLKV/gdCcGdHzdWgZIz1tueotIQfOGc+62BEbbLkfMj7HmczXrMFn+Mpq84oKRRYAFiVjjLv
	UB2QoRFmnR6jBSV6TrDbJ1uBrXBYtQbymBi1DKORlf2jjIw1w7yZAI6p6XbrRRF1w6f/rnxBMzd
	xvDDtzVAzkyepB7TMHAX/Omo8b4MZfCyjOqKKQJnS6IOqkwDprgvsNYXSQXT1zmAcHsdAq8/NwO
	XshTYw+d3y9wIddo5Drsb2hD9gMtRxfXwAAeu6wyRsQIha7M2xr2eGckY2Kh/wHTodGgM0/O/51
	aObYTvG0iRzLgKJu2ZNdWlUHhzbG6KHxZ9bjtsg7cJ+x5nmV2Kt/1
X-Received: by 2002:a05:622a:1a87:b0:4d1:3cd6:9a11 with SMTP id d75a77b69052e-4d13cf52657mr2305451cf.69.1758539061641;
        Mon, 22 Sep 2025 04:04:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBCUNakpqGYG1J4B6FQHrx3EVtFbRMBmVzUxMSLfoL7f9TG4fYhGlu6m6eI9iUwK4APHGPBg==
X-Received: by 2002:a05:622a:1a87:b0:4d1:3cd6:9a11 with SMTP id d75a77b69052e-4d13cf52657mr2305071cf.69.1758539061217;
        Mon, 22 Sep 2025 04:04:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-578a5f44b29sm3216528e87.24.2025.09.22.04.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 04:04:19 -0700 (PDT)
Date: Mon, 22 Sep 2025 14:04:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, bkumar@qti.qualcomm.com,
        ekansh.gupta@oss.qualcomm.com, kssb@qti.qualcomm.com
Subject: Re: qcom: Update DSP firmware for qcs8300 platform
Message-ID: <vqxdvetghn334szzrtwkgb2hgjck63lz25autamu5doru6co2j@ur7ptcbx2f6n>
References: <575b65b7-a9c8-481a-bdaf-bbab39389b62@oss.qualcomm.com>
 <mtdzhkdv7ex76o5gdfw3llz7r2g6yfonzsmvny6gy5wpf2onuo@m7kibf5nhoji>
 <14c359f7-d451-4cb6-9e38-5035566c0a2c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <14c359f7-d451-4cb6-9e38-5035566c0a2c@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: wm1gXZhBHry07gFMXYZsYp293DHLOOTx
X-Proofpoint-GUID: wm1gXZhBHry07gFMXYZsYp293DHLOOTx
X-Authority-Analysis: v=2.4 cv=No/Rc9dJ c=1 sm=1 tr=0 ts=68d12d37 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8 a=tQxSKMO6WOqUlF4-y50A:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzNyBTYWx0ZWRfX6F8i6YFc1Gui
 AoukvvU9y0NEppgvE2wWSaSPdBOtk/Gu46Bgeo5Kqa/W1MYGn37V0ELpYNvXHNuumUSQ5GHTJXs
 kXLNnIk3vMWg/SIEtT76pniPEtgu3Zt+Y+grSb21qnCdMZX7FDu3RbWX8morc19bNbFakrERWao
 GsfEHtq2ZBlEAaiggT6f/UQW8ad6jgWSa83gXVgVJg6zSDjmmw/AKXAuL6JIWKw9Bd1UMAElW+d
 pYMNnJ+Y1thKTDlSgWe15YNCC215tCXjWjXhvhCmCaYUIvO7os5cLbEt52aOgflPzU06s50De88
 KXwSqfkyvGWl1k9EKdVWX/QnTDjSX+Up+TKKBdj2k4Nm1fMhK0iw/8ZgQQDwPSZq0bA0856HrC0
 0nzcUUNu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200037

On Mon, Sep 22, 2025 at 03:59:02PM +0530, Venkata Kota wrote:
> 
> 
> On 9/22/2025 3:49 PM, Dmitry Baryshkov wrote:
> > On Mon, Sep 22, 2025 at 03:39:54PM +0530, Venkata Kota wrote:
> > > The following changes since commit 493de17dee9901605e69ad804815cd7408d84547:
> > > 
> > >    Merge branch 'robot/pr-0-1758303798' into 'main' (2025-09-19 18:33:44
> > > +0000)
> > > 
> > > are available in the Git repository at:
> > > 
> > >    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> > > dsp-fw-qcs8300-dspmon-125
> > > 
> > > for you to fetch changes up to 704b227a99683715bc8f3fb514bc6b9d18372f28:
> > > 
> > >    qcom: Update DSP firmware for qcs8300 platform. (2025-09-22 15:30:25
> > > +0530)
> > 
> > This commit isn't present inside the branch.
> I see them now. Please check.>>

Now it's good.


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> > > ----------------------------------------------------------------
> > > Venkata Kota (1):
> > >        qcom: Update DSP firmware for qcs8300 platform.
> > > 
> > >   WHENCE                  |   6 +++---
> > >   qcom/qcs8300/adsp.mbn   | Bin 6643712 -> 6684672 bytes
> > >   qcom/qcs8300/cdsp0.mbn  | Bin 3084288 -> 3080192 bytes
> > >   qcom/qcs8300/gpdsp0.mbn | Bin 5832704 -> 5873664 bytes
> > >   4 files changed, 3 insertions(+), 3 deletions(-)
> > > 
> > 
> 

-- 
With best wishes
Dmitry
