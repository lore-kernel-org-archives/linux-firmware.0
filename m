Return-Path: <SRS0=aam9=AH=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AB7CE87822
	for <linux-firmware@archiver.kernel.org>; Tue,  3 Feb 2026 12:40:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2DAF8C19425; Tue,  3 Feb 2026 12:40:49 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5E966C116D0
	for <linux-firmware@kernel.org>; Tue,  3 Feb 2026 12:40:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5E966C116D0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61382IGY255028
	for <linux-firmware@kernel.org>; Tue, 3 Feb 2026 12:40:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fxiG0BQObezT2/K8iaJhIFL3yTV96Snz2zic5iGEM3o=; b=pLvlyGwlFIlVAfwk
	dZJhoMZu+k+COCwrxAkWKJ07WNlA+mmxusId+lDCmR6PRKWkq9s56vhD4sXv8wNz
	xlycJ6j8dbI+76BXAlPU7SINbmosr/z6UlBNMqjbq+khpnpYnTwvoRNCIaqcHImI
	/Xc3bpaPxkhYM/rlTJGVXFUPwdNRFufey7ubQDkOg7y8zhsbXUXrypQ2FZ0R0OsE
	PHb+g3rCylCRMCOwa9qRIywGg8Y9DlOuq67GPB5qIUcc24xLIReh7q7lEl9eSkmi
	2J9q/yxberkOljiP9Gup2Qt1pjQHlDMla0Qbg5MMwQ96fcwtJ++JNdiUXqFuARXg
	8ORaCA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2v0km2p8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 03 Feb 2026 12:40:46 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c5296c7e57so1209998185a.1
        for <linux-firmware@kernel.org>; Tue, 03 Feb 2026 04:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770122445; x=1770727245; darn=kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fxiG0BQObezT2/K8iaJhIFL3yTV96Snz2zic5iGEM3o=;
        b=RpJYkH21ZB2mT2Yw8Rbg7b3JT/wOGfLF3ZSWUcBguD62QloHEzY8DPh5G7w0IieiVk
         mq63uI7/cBUOYi+1u6z5oo5wVsjpUYs9MquPo34UfFevdke2Z0SDIl4Myd2oAtAEnsL4
         bVqUG4jKUZHP8N5kLZSow9zcawS3RZoK6ibiO9LNc3nl5+7tWftcSKHbv4MbcedEAXV3
         c3ofi3sFcpNhohaF5pnE/I1+BOQ79X9JegloUFQ/vvnb3uI/z141kz6GM1N/lmhoJ0MT
         Us6z8KIy9Z42uwtstufQTbKWxJ1uQAxHmkXYeF1GL3tnFmAbmOc7/QnnoQqhsw2i81vn
         cCtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770122445; x=1770727245;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fxiG0BQObezT2/K8iaJhIFL3yTV96Snz2zic5iGEM3o=;
        b=VsUhUsE+qN//B4aZZyZWHhzwcjc+BVYEnciHfA3vsVDyUpDpsDskKBymZIjPqj+q14
         l+0H7Dn5ajF3kftnV+6CBjCnwYb4TEYkq8WKMEBKDSBl3RQXgimOps+uxV+MssYhJQs4
         Iv38B95TrgTA9PygSMFRca4s+I0GlcZxu9NX9uM+Zu/EipxcQ3B/oJxazi4LB/AuF6h/
         1S4s4RAKvXx4Xa23/krSDRA7fSMHVjA5dJuzGTx1stieT50bhmmWFOcmi6S1L4nwnwM5
         lZl3/NOtF+P5SuSAgqOlceTUhYwiLwiv8atNXU2AD2A6vy8tlBrRCMLTtkyx25f28trE
         187w==
X-Gm-Message-State: AOJu0YxY1c1ZPo82jRf7O8OQXI1hT5mSfXw4wgGpBi4ZbW11N840jwFI
	dJs44us01bP5lOIO1OZu/sli2wa5622t+f9Ysy+EBwOG8J9yg6WaEGKnFpTrMJNoJFuOYBZlZYC
	Qzl9rM0Wx9paMJnZZREz8xo2FIP2XSjIs4Jg5LEn/s9onuJicK7OoIAiPFt3Hej4=
X-Gm-Gg: AZuq6aL62JFDpqdy21A+ecJQc4lEgR4SZ5QQmtNbmt7AzVEAe0GYraYu49OYtU3MHgr
	FolsNZb2fp1Td6eHvyrwrkE4JJSWO9kGIKGPZgTeCPXGqIYcBGwAUzr9gCwQ+6lrC7Xixvb6kj2
	nsK5XuDUiBI+E8JZPrn2aKET9C9V1GWQxtObwbxAH9Tngw92c2oIoGNy/Ev+rHZpjnBIjpFBmBf
	jnYGINHCMAf9cgBZnYC3pDH0TVA5/3J6uFHwu9YXrMNMSf4iIQr7cVt7C0kXLr+ek68itKSq1h6
	O9i0IJ2ZG4NNaAqXi0CeHPObYsAfWPrcnJ4zMg50AM7YvOK2+nzy/PEbyePx3XhzBnUSrXWYHnf
	RRwzXFbh7Ut9425xuPXiDIS94R6DbYa8rIdZgX019Ca93XGZ3ehFuZrT9+h25gfZl2ykakrrrtJ
	sTa7sbHt1RxT2n1+w5eD03ZhA=
X-Received: by 2002:a05:620a:254e:b0:8c6:a034:9226 with SMTP id af79cd13be357-8c9eb34e749mr1857705585a.82.1770122445568;
        Tue, 03 Feb 2026 04:40:45 -0800 (PST)
X-Received: by 2002:a05:620a:254e:b0:8c6:a034:9226 with SMTP id af79cd13be357-8c9eb34e749mr1857702885a.82.1770122445161;
        Tue, 03 Feb 2026 04:40:45 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e07481b72sm4240852e87.11.2026.02.03.04.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 04:40:44 -0800 (PST)
Date: Tue, 3 Feb 2026 14:40:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Saddam Patan <saddam.patan@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, venkata.kota@oss.qualcomm.com,
        kssb@qti.qualcomm.com
Subject: Re: qcom: Add ADSP firmware for glymur platform
Message-ID: <qfsg6ibhsuivlbhjk32vbafj6eablll4p7kf53khka6hldj6eb@aosmofo5vt3s>
References: <01d9e305-f4a0-42b7-ba22-5a9907577b8a@oss.qualcomm.com>
 <5b58bccf-ffa1-488b-bf6b-28e19b5fd5d4@oss.qualcomm.com>
 <c097dd43-f1ac-4e7e-b4ab-1a6f74193758@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c097dd43-f1ac-4e7e-b4ab-1a6f74193758@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Reqdyltv c=1 sm=1 tr=0 ts=6981ecce cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=qC_FGOx9AAAA:8 a=ojpkO4GREUI8_LLAH3wA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDEwMCBTYWx0ZWRfXwYKopWTvipXK
 n3PdHn0NmOW1jknj+vJ2Kz2hA193dC8rKErp7KEvO1qtCquT1QRi+8mXyHKWCWxwcDu+hnQkoxM
 DUZXOPGcWFub24g3J9DI9vDbGTXWo1YSW7Z5tEKv5qtFNZgtTEruhjVtbA74NgeGB6a4qMZAxX/
 4qKjmWvem+2LkdOGBgCaYi0wmFar1fA2PkrcomT95Zc3c0RPfZBI8bfepfigTsfwAp473W0zkYC
 BYPfGoRQ+GgU35IBa6h1QXgDm4gaIMkHDFlz7Hoks6+RvRXHuTfBthw1MnQ7pCOTlTLJUnG/oAv
 1uMsfbNwMXoiazTTyYeeK7730OkiYjC8i/mnlqr6Ajm+o35Gw53ipcaafDXHl0FnGlqOO5l1Sib
 8iTZTNveuAfq6YD7ezkINQqysnByiXnWlq2lAWsRYKk+3doHHlocXXjjvJxfGZT7B+Ow0PZziUt
 m7qaTBCGm7P1HkpmkPA==
X-Proofpoint-GUID: 0HW_aqOq12qgT52_fgdjRKYKKP-49Zn1
X-Proofpoint-ORIG-GUID: 0HW_aqOq12qgT52_fgdjRKYKKP-49Zn1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_04,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030100

On Tue, Feb 03, 2026 at 11:11:07AM +0530, Saddam Patan wrote:
> Hi,
> 
> Internal testing for below patch is completed. Please help review below
> patch.

Let's keep the entries at least a bit sorted. Please put Glymur firmware
before Kaanapali.

> 
> Thanks,
> Saddam.
> 
> On 1/29/2026 3:49 PM, Saddam Patan wrote:
> > HI ,
> > 
> > Please ignore this patch as internal testing is still pending and we
> > will update a new patch post validation.
> > 
> > 
> > Thanks,
> > Saddam.
> > 
> > On 1/29/2026 12:23 PM, Saddam Patan wrote:
> > > The following changes since commit
> > > 0882248d05045565bfefe1f07cbfc22276c9f058:
> > > 
> > >    Merge branch 'lenovo-ish-uspstream-clean' into 'main' (2026-01-23
> > > 19:26:31 +0000)
> > > 
> > > are available in the Git repository at:
> > > 
> > >    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> > > dsp- fw-glymur2
> > > 
> > > for you to fetch changes up to 6b573904745830699030541b01003e6fd1ca294b:
> > > 
> > >    qcom: add ADSP firmware for glymur platform (2026-01-29 12:15:54
> > > +0530)
> > > 
> > > ----------------------------------------------------------------
> > > Saddam Patan (1):
> > >        qcom: add ADSP firmware for glymur platform
> > > 
> > >   WHENCE                   |   6 ++++++
> > >   qcom/glymur/adsp.mbn     | Bin 0 -> 18622472 bytes
> > >   qcom/glymur/adsp_dtb.mbn | Bin 0 -> 7253 bytes
> > >   qcom/glymur/adspr.jsn    |  22 ++++++++++++++++++++++
> > >   qcom/glymur/adsps.jsn    |  22 ++++++++++++++++++++++
> > >   qcom/glymur/adspua.jsn   |  29 +++++++++++++++++++++++++++++
> > >   6 files changed, 79 insertions(+)
> > >   create mode 100644 qcom/glymur/adsp.mbn
> > >   create mode 100644 qcom/glymur/adsp_dtb.mbn
> > >   create mode 100644 qcom/glymur/adspr.jsn
> > >   create mode 100644 qcom/glymur/adsps.jsn
> > >   create mode 100644 qcom/glymur/adspua.jsn
> > 
> 

-- 
With best wishes
Dmitry
