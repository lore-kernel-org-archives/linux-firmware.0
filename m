Return-Path: <SRS0=9uEb=3M=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 292A1CA1007
	for <linux-firmware@archiver.kernel.org>; Mon,  1 Sep 2025 21:49:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DCE97C4CEF8; Mon,  1 Sep 2025 21:49:39 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BD231C4CEF7
	for <linux-firmware@kernel.org>; Mon,  1 Sep 2025 21:49:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BD231C4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 581B4Ma1028957
	for <linux-firmware@kernel.org>; Mon, 1 Sep 2025 21:49:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3hRkTjE/DYsIDJ16L0LFjWGXbCv7EihyjRSUfMy6t5g=; b=egIM1BPNBLNs+uYl
	MgZI5Rnl2cGXUZj5LgNa6E0+RGw9i47K0RUrc7jbJf2gBj2owgI3ulTmDU5uh+hG
	fhI2QKw9GQ16z6Sb8314ibGB6GnWUKaWdBcnJKbEMMlbGlToIHzf6LZysGtSnRZG
	3GySVt5GkZMDevjlWZeuq+OvvPi5s4Rq9973exA1Klr/zZvxA0mGaLFAZFynk5Su
	tC14gqCr4oxjZGk1KwIAyZ/6klupV4yzfrXePlZ9DEnKNKQkQyOH+H5T3PcJN+NG
	rKbbl5Rjq0984j6Nv/AP9kPYZZfDltxtGzCEf+rJd+23GanbUZxJAGqM0OVqu00X
	T0a74Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmjdu2r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 01 Sep 2025 21:49:37 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b340f94860so8854001cf.3
        for <linux-firmware@kernel.org>; Mon, 01 Sep 2025 14:49:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756763376; x=1757368176;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3hRkTjE/DYsIDJ16L0LFjWGXbCv7EihyjRSUfMy6t5g=;
        b=MXSdLMHfZCbatdSlpWEPEoGlilFZghYS1CDvZ7iDnI3hExU+h6znxvO9H9g4YK+v0l
         i1PBNbQWAPAGTBptmFeYZ+8WZ0DtbRIAsnwIm/sctxrMu938WvXYefB8R66h7OQw0ZyG
         e/H+SUTJU1yaow7PaTjsc4xZOp+RJ7dcoKwuRX01qw2w9nwzg0KRBbtujaW3FDrZWOpp
         0dLOenKr/6lSnTU6bap7GAy7uY1RfwSOU9w5lDdP56BH3TSKagd5vXc+TQGv5re9W+Yw
         CEjCvm+j73nZige81tZRRULKgjhUk3fGhMYdmKo89FT9m997A9iWBbZw/b0bUUyj1YnF
         lFQw==
X-Forwarded-Encrypted: i=1; AJvYcCXMcAdcsgtc9+hQ95HHiLozNAf9DjHI7V/VDggCGzERqN3iPSaH2+Qp9R5UPHBRSE9one7yKQ6Gzr8VpG0h1w==@kernel.org
X-Gm-Message-State: AOJu0YzEagwLuJNGbmmXT2c18Ckvcel5271YeVRAGJy6ojjuNBVeP+NK
	5wdIoDz4+7iGde5MGGuhWpJZpRupFSajDr2HI7oxa2DQ/T7aZ9PEAC1/RUwORSwc0PUNPJn5aTQ
	w1p7a/ldSg8jeVFO3P24KEoPGaU7NbX304STWNOVyMYUaAPrbaskA43Bmz/pg+6Zbsq+WLy4=
X-Gm-Gg: ASbGncv26nwqQ4RNEqtnpY90K/WnPxuBZnAahkjW4Qs3wv8nGHN9OSy7kn64FWVlzXn
	T5sXkQk5cRbYRk66pctGrdKLQR1uy8sruzrhqFwb/o0HPajDwrV89YQ2u0m43qvBcBz5LBdIdAU
	CBU2vZ1ClBWOerZs9VmGCr1Kh8DlexsLuwL9oClYj+gpjHVeYHrqTnUphPxllpuhipen/sZEwdi
	5sS/IZWt3YguZTegmrU37zW1TtB/su/oYqpEt9Lbse2FFXFuef8gj75rzD/YRlmOuGuaO9fRdLa
	Yhxtv//OGz+jQX0lFXqhAjPecdbAkIRpQz7miq47mgeughWDbOv0h83vSpeQ4PA9RKlc92WEq/I
	5vfwZlIL8DKtKmR2c/eBufsttoPze3PzQov01zOzXJefby9Nto8Yu
X-Received: by 2002:a05:622a:2281:b0:4b2:ed1e:8a3 with SMTP id d75a77b69052e-4b31d9ddbf6mr113652541cf.24.1756763376116;
        Mon, 01 Sep 2025 14:49:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEos3FJZNFIfBaqWrBJDmtIHyzG7wfaIPdu6xBxViHio44k2gGaZC7UISh2TF1W9ECUX4lF7g==
X-Received: by 2002:a05:622a:2281:b0:4b2:ed1e:8a3 with SMTP id d75a77b69052e-4b31d9ddbf6mr113652351cf.24.1756763375461;
        Mon, 01 Sep 2025 14:49:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56082793359sm113123e87.88.2025.09.01.14.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 14:49:34 -0700 (PDT)
Date: Tue, 2 Sep 2025 00:49:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xin Liu <xin.liu@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Josh Boyer <jwboyer@kernel.org>, linux-firmware@kernel.org
Subject: Re: qcom: add ADSP firmware for qcs615 platform
Message-ID: <w2wyrr5i4igi2dh4sea5qpk2mbumo2kd7jt4dvykyuxmoevw3m@fp6xf6w4gfso>
References: <783737b1-05fd-41ad-9bbf-8d0e601f3b08@oss.qualcomm.com>
 <cdajgj45c2nycpaprilxq55ke3lgprybsokbaf77apoivdocpw@tea6azhm7lq3>
 <CA+5PVA6+onWZ4u02_W68iRYaSY1rdM3x9_oJXoX_Ws3R_wXXZQ@mail.gmail.com>
 <k6o5sa427tokneyu7vhl3rfhgqfxgemx4pjgxi45cf3j2z55z2@zkv743tjqjyn>
 <10ab97d7-52b3-4056-8098-309eb35b0e59@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <10ab97d7-52b3-4056-8098-309eb35b0e59@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68b614f1 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8 a=nAqaJPDk1xWeVZjpGBwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: s8nKH_FmToHo62J28YMFwaS8CFpdN68u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfX/FUVLHLi63Cj
 2XQvhyL3u0ALW4OIy7DsWE0cJm15mWPe4jviWOlrNiWZWmhfKUzbQgmvyvhIoB4yS8y64eUtg2J
 ctWBuW9kwpO7R2EYe9gwknTT+nl7BRvMhsIf2wwj6jdJ/C5ZNn6aaJnL8EDvJeQWRh1Fwt+sYCN
 ANXftiCK7oTe8v5tjJBTkv70KK+GpPFyAFaXxeZgL0HOq2FZHl7mJ9PKkCj1fN4WFtVklxREG1E
 XtqCDsXVjWnvgs+X7Z7HEIg1m509cNZXbxApxel/5t9CQgGgE9m+2v8dZYM0VZZLdssq1czdVZ4
 HMtqY4xk+hlUOod8Uumtpng5kTWvDYL3udJW30xZDh45YNgZgzocv4Ey/2W3O0esQqoqZ7cTqrY
 RB7lORRN
X-Proofpoint-ORIG-GUID: s8nKH_FmToHo62J28YMFwaS8CFpdN68u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_08,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024

On Mon, Sep 01, 2025 at 01:52:56PM +0800, Xin Liu wrote:
> 
> On 8/27/2025 10:07 PM, Dmitry Baryshkov wrote:
> > On Wed, Aug 27, 2025 at 08:52:51AM -0400, Josh Boyer wrote:
> > > On Wed, Aug 27, 2025 at 7:53 AM Dmitry Baryshkov
> > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > > On Wed, Aug 27, 2025 at 10:57:12AM +0800, Xin Liu wrote:
> > > > > The following changes since commit f044bc789f8e7a4427593b687801644c39e3e8b7:
> > > > > 
> > > > >    Merge branch 'amd-isp-staging' into 'main' (2025-08-25 18:22:13 +0000)
> > > > > 
> > > > > are available in the Git repository at:
> > > > > 
> > > > >    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> > > > > qcs615-adsp-827
> > > > > 
> > > > > for you to fetch changes up to 542611790f77a67a6a24c08d087d22585caa5ac2:
> > > > > 
> > > > >    qcom: add ADSP firmware for qcs615 platform (2025-08-27 10:46:24 +0800)
> > > > > 
> > > > Reviewed-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> > > Fails check_whence because the files have the executable bit.  Can we fix that?
> > I'm sorry, didn't catch that up in the review from the web page.
> > 
> > Xin Liu, why are you sending a pull request which fails the check? Did
> > you run 'make check'?
> 
> Dmitry, I have fixed the issue about the executable bit. The changes have
> been resubmitted. Kindly review them at your convenience.
> 
> The following changes since commit 993ff19b553cd4d252fdf99f07c28825ef57b862:
> Merge branch 'main' into 'main' (2025-08-29 17:13:10 +0000) are available in
> the Git repository at:
> https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> qcs615-adsp-91 for you to fetch changes up to
> 7aeff2162e6bb1875cabcf26caba01264194768e: qcom: add ADSP firmware for qcs615
> platform (2025-09-01 11:00:40 +0800)
> ---------------------------------------------------------------- Xin Liu
> (1): qcom: add ADSP firmware for qcs615 platform WHENCE | 5 +++++
> qcom/qcs615/adsp.mbn | Bin 0 -> 8536204 bytes qcom/qcs615/adspr.jsn | 21
> +++++++++++++++++++++ qcom/qcs615/adsps.jsn | 21 +++++++++++++++++++++
> qcom/qcs615/adspua.jsn | 27 +++++++++++++++++++++++++++ 5 files changed, 74
> insertions(+) create mode 100644 qcom/qcs615/adsp.mbn create mode 100644
> qcom/qcs615/adspr.jsn create mode 100644 qcom/qcs615/adsps.jsn create mode
> 100644 qcom/qcs615/adspua.jsn

This is totally garbled. Did you check what you were sending? Also you
ignored the question, why you've sent the changes without running 'make
check'. That's sad.

Now, could you please send a new clean pull request? Linux kernel world
usually prefers people to start a new thread for a new version instead
of using Reply-To to send next iteration (Mario, Josh, please excuse me
if I'm giving a false suggestion here).

-- 
With best wishes
Dmitry
