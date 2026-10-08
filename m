Return-Path: <SRS0=aqNB=H6=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42710CA600B
	for <linux-firmware@archiver.kernel.org>; Thu,  8 Oct 2026 13:16:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 190A71F00893; Thu,  8 Oct 2026 13:16:56 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1791465416;
	b=N/dlj572vAijMwocnWsMrUEhaH+eXxsEShLFxMq3on0QEuESq2Z9hvPyJ6C7Ax3lKBio
	 nlCCJs0azRpDCguhELh5KV4M5YWxlkMhqyuUzjmJOWZbq/ofIS6EN5SBET48Km04RbJRt
	 uNoWkiUNnDwN4FXtoA+GG8qdzlCOB29ZHnrW965sMQNSlKcsI2JkjJagrJroFHfyZ6OXX
	 K+Odt8pr+MRP+u1lmbvxr1O3UXeBXZS4JHtSIhCFqWkCugYiKQh7yaqqyR9AcJmb27hdz
	 IPEIvAiOh1fExK6MUqinQt7L2YiRvLgfIBGdc4HGOzQgfm4QIjSjhZeyRRS41swtggw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791465416;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=qMgPWIwos9KwdcTLDs9XAaaoonVnPWSKzwwcfxUT4Oc=;
	b=nwQqUe4jG/HfJrbWSachzfR4yJfF+VO92upmkSFWI9H9FknSBXKwex2vvh5ym7OnvDOx
	 QsW8kj7WwW0AkhF0wl0vJTXPHT/gDlDfRPFNxfhwVITtWJrDja30WtTGXkl0D5+0NIoU7
	 FzrHuBXwidWva9jYzZQMm+C89EBfif/nTGxpp1JKbvqSMjq8lKFdxufdA0xICfC87eT2Z
	 vgmlvALhYf9bt+9CyZTeodVvKDB2DBalIFyVP59DdwRTtSU2wRLd75WHn9+ZtpkkZ3t5T
	 Nm6mC8/qZl2Cu6I7p1yJLkDF2ZnPUy0kZmCxUJxv7Md+pEQJjW+dwsR7Wvj7VL8jnXA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fT8JsrX1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ByaqEXIT;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6CF1C1F000FF
	for <linux-firmware@kernel.org>; Thu,  8 Oct 2026 13:16:55 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fT8JsrX1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ByaqEXIT
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 6CF1C1F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698BKDLP1269585
	for <linux-firmware@kernel.org>; Thu, 8 Oct 2026 13:16:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qMgPWIwos9KwdcTLDs9XAaao
	onVnPWSKzwwcfxUT4Oc=; b=fT8JsrX1MTCXbD2cS2n1DnARPSOsx+DmfZZfGzCH
	KOIRT+0WYwYQTgMhq3a6QfPzY/YjAkTaFL9yOTHuVdLb5jrlxZPOw9c8Lvl/437w
	F16NxZzWsUmNRve/g19RRkhmg4wr4AnXHYmSVd6yc2nCLIhYZ4rnl74jvg2mm+Ca
	D7KNLIg/0leFXt3E2bYB9jLUJuFr82owdELlduhqnl+VGwUR3g8yJLBssYxWBRtt
	vgXHUMs/yBlsZ4dtcENw0hFdO7ikkCGBNVXtSwV+HMU4TdLKYsBm/Y0M450x2OYz
	vAUAtNYtpMVBMVikljcZEhpTmnh/SXHs6Z2Q1j026loHbg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe32xsc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 08 Oct 2026 13:16:54 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-988d79b90e6so413746241.3
        for <linux-firmware@kernel.org>; Thu, 08 Oct 2026 06:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791465414; x=1792070214; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qMgPWIwos9KwdcTLDs9XAaaoonVnPWSKzwwcfxUT4Oc=;
        b=ByaqEXITUQcSXugkQ6vmQ6L1zFjrDZCS8Qo5I7raxxkg+2rOVkaZHNvZ11O2twZx5x
         fkuJPwGOObzzvht3HXRbaxiuL65CXhs1xzMfU8iRrcbUw/EH4881zD207iM4lJwJaCl8
         4lKqdHHbgpzocS6iS6v6CX2LYWk5hbYm7pNtL0y45k2vaMUjGmoYbrbrhh3Owkj4x6Qz
         TPIY5giFYcjoYpqIIPk+EycNbfoojlWagCQqa7SaLMB0TnY8JmeHKyRg8HQwIGpSpL13
         8FpuPqoA/S+UIgCsut96hQFPL4bFhlYiwAZfPGGkhR7HlWsacXAhRWsBriiyo4DWFpKu
         ysnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791465414; x=1792070214;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qMgPWIwos9KwdcTLDs9XAaaoonVnPWSKzwwcfxUT4Oc=;
        b=2oY8gJT4tknCW3BlItzjhZ3M7wRkC8QiNOtECdmMtGfaKgutBYrOZjpj2tnWGK9PfH
         NKSTy8L+QWIZD8fhNoGKNGKDegdbK5BXqbgGRAM5eh4C0ff5LKZ+EsFksBA0XqMNHxbU
         utlS9G8LwnjhKBEZn/vWXZRwo3DD1gSPruT4cZgnUmX7yEDLSNQgiw+rZFNQpZkjjSJq
         3r+kS9Ds5oNL/qjl25CEvyvEfb7tWJhSjoOK92hf/WBwNX8KzLa9LoMSApp5Wfadqgnb
         pOcLeO9/1rC7gq2VBk2GAL5w5EWhy1vAoxLkTfBhV3mv5kER18eS2YZ5iQV+ZqorgHJ3
         2dcw==
X-Gm-Message-State: AFq9FYK6jteQRZ7lNasfRH3nfa6VMwEyRIj3Kwn0yOVlF6oFOWEixorQ
	WWWfKUYdZgHMJTfEF1jgB/tf42ACSQZDSSQ2qBvj0taH2uXLjsMzWLMOmZ6WKfiylsarDy/Hp4h
	HwlWFFVUC0YLnAumvycPD1ZQkU+AENaBomhqfsD1sIbgzLdCYZRf4NDQ3amZDmTrpttSUyHimnQ
	==
X-Gm-Gg: AYBFou20j8mGVvGEcBQBL8FQClJDzz3f+DxkY3PRvvj2X51cpz5jxL8J9kC1CjSVkJ7
	Q24Va6imssRSHRE5Ka+YuD1a+u5vcVRGjzy93gPxG+ahptLYBUNU1IQkGdTixwaurbgyziglBNl
	xI3pSlzayKUjrpyI/1n2X+m2m/ZGcYFV7FFsDmeMh3G0/YwKZ9s4CtUwC9Zf6k5nojxRFmGHr1E
	1Whf85Bhy/qS6mFkscbJMknyRQyF5kvkB2ZSVAD91OkttWfc8m2NHt7KlbZS9OC5KHZbTv9psXZ
	gZDXEmbVshKxgn5H3+lV0gVGrWv3mVZ0VQNVxdfOgyV65KsB0VCOmoUyih/IBOyeMRgvp+FILen
	shOgQobGXMBfwXmvyJb4VAwF3QKX5NaNcLLyuK39lQqFtDbPBoyqJ0zPA7A77xHxJRsYtpyEI6S
	qnf5ftwbQKalsA
X-Received: by 2002:a05:6122:3114:b0:5c9:c60e:3a44 with SMTP id 71dfb90a1353d-5e6d360229bmr1770017e0c.22.1791465413690;
        Thu, 08 Oct 2026 06:16:53 -0700 (PDT)
X-Received: by 2002:a05:6122:3114:b0:5c9:c60e:3a44 with SMTP id 71dfb90a1353d-5e6d360229bmr1769972e0c.22.1791465412985;
        Thu, 08 Oct 2026 06:16:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcd30828b9sm1240798e87.37.2026.10.08.06.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 06:16:51 -0700 (PDT)
Date: Thu, 8 Oct 2026 16:16:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Saddam Patan <saddam.patan@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, venkata.kota@oss.qualcomm.com
Subject: Re: qcom: update HPASS firmware for nord platform
Message-ID: <fi5wfe3cidkxd62s26jtlfdxhoqlxedhqzyp4f6ziqal7jjmrj@wqrvobgj7b4a>
References: <c219edbd-beb7-4259-9167-0a0e2168b5bf@oss.qualcomm.com>
 <arxtjcj7y4yea2l2k3l3dknoyytn3aazhv2eaemnzl4ay4ayzv@z2c5l46k2yep>
 <80509263-f623-4708-b12e-e81e698b1004@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <80509263-f623-4708-b12e-e81e698b1004@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA1MiBTYWx0ZWRfX6N2OgYEgof2W
 TMCpFxC12d8YlaeCacWTbiD1x7FMPtLb9T24/ZRuPJ2JK9uvi4T4Nf/4cqHPLuYhu/e7zXvy418
 MWOK/yRSLVJuSGqWTRDHoSSG8nVNyUZb6ACaHjzvIycaD4d1nDppyfgG5IRD61Q77g9swj14qsp
 NhdG2SraDTlnzGHRINrj7p98XM7PIt45oZGb2cqjVTfn1PuRGLo6cDVIuqd93ky88fPVKHRebLV
 oLFcOOFQ7sTA7ucNSyQYWKlPmgsWv+Z2l0tkN9nmjj+Wb+4QIbyVgxXe+8REbrYs81XDgxvg2QD
 8uNcWzFKNReRzrUeVzpcx+L28j1Z6F1PgsSbhKLizZbw1juAncqBvu/HldR0W1+AyhXLfRnf8yK
 K29J2Rwm4rn/QqpRLqovWAr1sA2t2XsvN47CTrVRXfHXR+ExSTdHrvFwDo7Ga851jK3cu726QCz
 XMinZvpVKbtc/Gu+rUQ==
X-Proofpoint-ORIG-GUID: vRsVowm451WRG88Q90d5wBjmaEC_7aDd
X-Proofpoint-GUID: vRsVowm451WRG88Q90d5wBjmaEC_7aDd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA1MiBTYWx0ZWRfX8kTcGXPePjgO
 gGJtx4mJjfnUaW4ywI+SYm5IxHgyExbXLpDuzdX2U8sB2SFfdPLpMU4gh9Ej4kDCxqxchK5lVFe
 prDr5qOrmALvNMzvyO9FdVD9ZJh4rUI=
X-Authority-Analysis: v=2.4 cv=KcdHIgYD c=1 sm=1 tr=0 ts=6ac797c6 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=qC_FGOx9AAAA:8
 a=teD1ZyU5AZT69zMKMAwA:9 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080052

On Thu, Oct 08, 2026 at 02:10:36PM +0530, Saddam Patan wrote:
> 
> 
> On 10/8/2026 1:16 PM, Dmitry Baryshkov wrote:
> > On Wed, Oct 07, 2026 at 07:23:00PM +0530, Saddam Patan wrote:
> > > The following changes since commit 24247053afda2bab6b4ace42402dbf9f3b1305d6:
> > > 
> > >    Merge branch 'arch14-8' into 'main' (2026-10-07 12:01:52 +0000)
> > > 
> > > are available in the Git repository at:
> > > 
> > >    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> > > dsp-fw-hpass_new
> > > 
> > > for you to fetch changes up to 5821af7ef9b4cd96ad1d9f9a11d5041ae4b02594:
> > > 
> > >    qcom: update HPASS firmware for nord platform (2026-10-07 19:19:58 +0530)
> > 
> > What is 'KW issues'? Think about Debian or Ubuntu maintainers deciding
> > how critical is the fix.
> > 
> 
> There are 2 Klockwork issues Fixes:
> 1.Static analysis fix in the QDSSOn function prototype.
> 2.Out-of-bound array access fix in the Audio Framework code.

Is this a part of the changelog? You only had KW, which can mean
anything.

-- 
With best wishes
Dmitry
