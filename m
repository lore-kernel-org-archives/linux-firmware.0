Return-Path: <SRS0=MiJQ=W2=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6F3BC369A2
	for <linux-firmware@archiver.kernel.org>; Tue,  8 Apr 2025 14:38:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A4533C4CEEB; Tue,  8 Apr 2025 14:38:47 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B1A12C4CEE7
	for <linux-firmware@kernel.org>; Tue,  8 Apr 2025 14:38:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B1A12C4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538Blidu020165
	for <linux-firmware@kernel.org>; Tue, 8 Apr 2025 14:38:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VWCLIvsjvRfVpukU2rADoh1yjh6lSpVu03vrCHRJ+ac=; b=JWn7Tu+Y486rHD42
	bOZ+hm+/QeaYs/CZsXjIgXU8RAmrI90rzYCvUVjwzW00pbZPaDj2eYCqVfWSZVI1
	v5ndam5PLQily7NTZnrti4oV6TyQc6R2Fhj/5YgTGidVvRv/5Wl582SNEiLDb7b4
	9Z2B820vtKXrDOIqVUr+c5ivji3zAAjDgjB9alDCwZZL+vnksk6kSRgaK/UplAiX
	GZ3kHvComMoelEJZ9Eiz0QEeSi6Fta1jfmHRpSKbDNQ9ByN1o5cQtvfExtIakycU
	lGaSWm8ZFzOMH6wpJ243GeWCRmTW6gPs7Ac5gPiHZ5X9pHBhy51eTLCv7pFIqmEg
	JktsEw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd2r39f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 08 Apr 2025 14:38:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c57f80d258so1849512685a.2
        for <linux-firmware@kernel.org>; Tue, 08 Apr 2025 07:38:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744123124; x=1744727924;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VWCLIvsjvRfVpukU2rADoh1yjh6lSpVu03vrCHRJ+ac=;
        b=XaLoX1VdwyeCkbKMeLrhtflmnPJafekPMulllRXufSqQCZ7qp/unj35M7oDxrn9bVK
         SeEVA7MBgz0EusPttMbn4WwJtDl4Qsfef74J6MYovV25jWNKB/7jILVYD3g2YMIM6EDA
         Ozil3hAbfE7mcXqHdPW7g/fvDhXvFxfIleo+tN6o5tDFy/6rlPSGgbiOsLA9TO86E2tO
         X2g5a77ssLXSYN0CFakH94XBrlCUcdjiAsKusIKyH1BmSo3nX4Gwt4mMJ0PeCUnQ+F0f
         96y+9qMruw6SoN9cWM/QSU4y/x3g4NJPyIraWQD5r3PUcFdWTAJqPesjR7gH19PDxpJ8
         F/fA==
X-Forwarded-Encrypted: i=1; AJvYcCU0E4hNWHvWWaNm5g7UGSBIMEZOsTVUeMJg5joEH4AnhmlXjQXr2xFiZ/8hHS00H1AWvWi60BEZRQANyGeOUg==@kernel.org
X-Gm-Message-State: AOJu0YwdGq020dYAuESpAsQGGvP/7+QRqM5/n/XLKgQCLP5Mc8ciAkC1
	Tmjzmz23dpEtzUgVqNX13amdG3yCAiFFwrZY9wy57EFg26XZAo4x1XZOUGHG9B1E4WHaQaL5rY5
	hNfzlZ6wCktZ6fK8qsrXe3WU6c0eOFYWPg6uBPjY+psRH9iDlzbyXrF6c20c=
X-Gm-Gg: ASbGncvSq6pKNrtGUouGpPNm9MCJPp8Ri2exGjfmkmsJcZl80WuFBsVFdBelWBcXwC2
	tEKVUyyh7hrNXeZwBtkUPjKoFvmcImw2Pb/W+wMip9uAxCQvqkmJ4rm4NNkIiJjwpsZP+4019c8
	6VMFsjHrTAdFGWdLXaq1j9zukXqgCNYJB5H8BMR0aOir1d1/fQspBOcGwxtuKMt35mB201iMqxU
	kQ/TGZl9ELmrc+jSjzEo/ml/efowJXSArib0A3fJoa1OPZxZ1ngwS4dq5M4MIcY3WQXUpL+eFee
	DcalXALBDCtpnTbdp6YBGDCvThTCVEhPYOHBAG1WHzGmKiMyhDSTzoEX4qztr7RUafbtShFWpII
	4Ekc=
X-Received: by 2002:a05:620a:2409:b0:7c5:fa85:1ac3 with SMTP id af79cd13be357-7c774dd6aafmr2392559385a.45.1744123124315;
        Tue, 08 Apr 2025 07:38:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFY/GqM8CHuaigD+O5b5TeQO/ub3jZqsr5BrQ1eNaV4wlM9qr8cu4yiYCTniUmbqRu69a/HbQ==
X-Received: by 2002:a05:620a:2409:b0:7c5:fa85:1ac3 with SMTP id af79cd13be357-7c774dd6aafmr2392556085a.45.1744123123924;
        Tue, 08 Apr 2025 07:38:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e65d597sm1547507e87.173.2025.04.08.07.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 07:38:43 -0700 (PDT)
Date: Tue, 8 Apr 2025 17:38:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Zijun Hu <quic_zijuhu@quicinc.com>, linux-firmware@kernel.org,
        agurenko@protonmail.com
Subject: Re: [GIT PULL] QCA: Add and update Bluetooth firmwares for WCN785x
 with USB interface
Message-ID: <imzwotcjhot6dh4j2rwqkft4fdopbhyi53dhqjdtsg5bm4nygg@ieg2crq6sfgr>
References: <882c9f31-96a2-4057-aab1-5d39df3f20b7@quicinc.com>
 <r5wix6wmi5mw43cyzwb3j36az66nih2bwurkikgwgw33kltg3p@b7hyrp3kqyg4>
 <CA+5PVA7=qvpoY1VsxbReiLjKYhFd3xysmC51VvVujWQ2MkZtiQ@mail.gmail.com>
 <lmntn442hpprtvhxifxqdycpcqhjcl2oz4fp2egozv5vb7c75v@nm7nojxkmtkh>
 <CA+5PVA43pmNLaZz2rWkWRvyYJmjVqzbjaDVSLrvcvkY0NwwTow@mail.gmail.com>
 <CA+5PVA7=hshod5He1q4uEdH6d5pLwPiDNCyfe3_29EjESsmypw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+5PVA7=hshod5He1q4uEdH6d5pLwPiDNCyfe3_29EjESsmypw@mail.gmail.com>
X-Proofpoint-ORIG-GUID: SetMQIkCblmE55ZoAbWmtmOugr_0hz7F
X-Proofpoint-GUID: SetMQIkCblmE55ZoAbWmtmOugr_0hz7F
X-Authority-Analysis: v=2.4 cv=NaLm13D4 c=1 sm=1 tr=0 ts=67f534f5 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=p0WdMEafAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=w1XRuW7vmlV0a61Bqm4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_06,2025-04-08_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 clxscore=1015 phishscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080103

On Tue, Apr 08, 2025 at 09:46:01AM -0400, Josh Boyer wrote:
> On Tue, Apr 8, 2025 at 8:49 AM Josh Boyer <jwboyer@kernel.org> wrote:
> >
> > On Tue, Apr 8, 2025 at 8:46 AM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >
> > > On Tue, Apr 08, 2025 at 07:59:40AM -0400, Josh Boyer wrote:
> > > > On Tue, Apr 8, 2025 at 7:43 AM Dmitry Baryshkov
> > > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > > >
> > > > > On Thu, Apr 03, 2025 at 05:41:11PM +0800, Zijun Hu wrote:
> > > > > > Hi linux-firmware maintainers
> > > > > >
> > > > > > Here's a pull request for btqca bluetooth driver. Please let me know if
> > > > > > you have any problems.
> > > > > >
> > > > > > The following changes since commit 41a528251649772edbcb705a40e617fd14858e53:
> > > > > >
> > > > > >   Merge branch 'intel/guc_70402' into 'main' (2025-03-04 19:09:49 +0000)
> > > > > >
> > > > > > are available in the git repository at:
> > > > > >
> > > > > >   https://github.com/zijun-hu/qca_btfw hmt_usb_x86_0403
> > > > > >
> > > > > > for you to fetch changes up to b12240420adec3089fa0bb5a09eaa0cefbd8ce76:
> > > > > >
> > > > > >   QCA: Add 8 bluetooth nvm files for WCN785x btusb (2025-04-03 17:18:24
> > > > > > +0800)
> > > > >
> > > > >
> > > > > Josh, it seems this pull request got ingored / skipped by the robot.
> > > > > Could you please take a look?
> > > >
> > > > Thank you for the heads up.  There was a merge conflict in WHENCE that
> > > > I manually fixed up.  New MR here:
> > > >
> > > > https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/510
> > >
> > > Thanks! It seems check-commits errors out on merge commits.
> >
> > Yeah, which is weird.  I haven't run into that before.  I'll poke at it.
> 
> Now merged and pushed out.
> 
> https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/510

Thanks a lot!

-- 
With best wishes
Dmitry
