Return-Path: <SRS0=MiJQ=W2=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5E4AC3600C
	for <linux-firmware@archiver.kernel.org>; Tue,  8 Apr 2025 12:46:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 98B35C4CEEB; Tue,  8 Apr 2025 12:46:06 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 70C77C4CEE5
	for <linux-firmware@kernel.org>; Tue,  8 Apr 2025 12:46:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 70C77C4CEE5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538Bb20n010533
	for <linux-firmware@kernel.org>; Tue, 8 Apr 2025 12:46:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lrny5545piH2OuNb9QFNCLG2O68IezxBlL3FLsSIZbE=; b=EBXrxwz2BMVqjV6U
	3Be1aVffEH7R9rMMebz+Hn6cAX6WGko/ncBSRYDIxx1zq527PerLYH6MlN4kgkG/
	UIgi4WbE1emD20CmtC1sYHC15UMGRTm6KEhCGYPQsqa79REoeA3bA7veI7w24Um9
	LUqOaLy8eqR2gaD+F/dFB+90Zxa9y60o/RwkgnLBFGmGxuOz+2OHcrVrj4dR4Lod
	rutI76B10SWKaeCZuYgGfNXVv1TUw8qFtA39oQ2HQgQ/mhHh05rgSYE4HTD6m510
	U+RB83oPuzElMWftRk0Vpmnh6seCZGtqHMSRJL95OBu+FPiRqnoqlVy5jYJQDIYR
	ReKN9Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twc1fngt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 08 Apr 2025 12:46:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c579d37eeeso872923285a.0
        for <linux-firmware@kernel.org>; Tue, 08 Apr 2025 05:46:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744116363; x=1744721163;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lrny5545piH2OuNb9QFNCLG2O68IezxBlL3FLsSIZbE=;
        b=PNL6/wLFC1/T5Kt5KHzY+fCTdYnLxK09TilMbv/Tpx16JWDJBneUvtqw+2VRsRmi9o
         q86eUGRmFwpYeagnz8WXh7mZyWapw2huY0Q/ecff3ErYg2/ejeKBbt2o6CvRvH94E66o
         zSbf7k2tTQWQJRssLzqsxcoTU0E0CMeEHqt2o3U9Iifei7/xeMmQKNFETipVFUH9qJN5
         jp2cSXLzeOt8/sfylsRdexwsLLStDihxWaC4tgRE7lszpzpqINj1JgN2ntY/W2W1VP59
         E+CU7d+RmYKjXtUQpOhTsxdovhhd4EY1WH2giI59wKJyYD2jwkioKH5Tap3R2YUF1vsO
         vU3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUmGAZ1HcI/iL71SFuTLl9GPVeYs3mdSIqUu9nFNUcTeLDWFkJ3gYQLlHc+FcTYqsw7jVNhdRJz8gTEVFaOEQ==@kernel.org
X-Gm-Message-State: AOJu0YywcKUsTxx477FXrUaFtgGT3p0C8wbrlhJiTNsCQgOfZYaSdRhM
	BzKG6ZMkDQMvSkPADmL75i2wzkYtSROV5xbAIKHtT5wUwxDu9HQqSynUa/y5IYXTKldSsjrNmrd
	Vtsc3+la/s2s4n2Dwiml/IyttBbqNLE1kaEzYLqkkx3DznmSSh+PTHvvD/VA=
X-Gm-Gg: ASbGnct/64y7T18AQ8EE0gWxV97dqjKxXV+bw+Gg1b3Jg6ts7y4+4j2CizGS8o1bagf
	VqPnic6gbubCRzW/GnPO/xgdZxZRyAfj+mjHUJllljkoBYEEXlumqg0vl9t75yw0LZPAnA3unXR
	ACA0wMuqxen1jCx0ZlbquouVslsjAgzddxXKv5sjAb7mgMg8PbD905fOnd/Ij0jjWi10708zuFt
	TkPKqQSxpvOm5mniMtNyCM/1aVxJVjDgKwjc6lcGsmc8UscuMHt2AzylfreYjV9aQzETR+QCuvm
	rMvnnCrx41aCR5pluHBghFff7/KfOxxADhpnku0/MpmLs97K5qmDYTfr9/DgpInAJszhKGDv5OJ
	CLN8=
X-Received: by 2002:a05:620a:2453:b0:7c5:7a1f:4d89 with SMTP id af79cd13be357-7c774df78eamr3065390385a.54.1744116363439;
        Tue, 08 Apr 2025 05:46:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPuzc4Kz2hTjVI231L7NoE1rR7Yaq0+G8rxqW0lmKOzJbSrVIO4RYyAKwC3APwgK5zRDcGQQ==
X-Received: by 2002:a05:620a:2453:b0:7c5:7a1f:4d89 with SMTP id af79cd13be357-7c774df78eamr3065386885a.54.1744116363126;
        Tue, 08 Apr 2025 05:46:03 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e635c46sm1529867e87.129.2025.04.08.05.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 05:46:02 -0700 (PDT)
Date: Tue, 8 Apr 2025 15:46:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Zijun Hu <quic_zijuhu@quicinc.com>, linux-firmware@kernel.org,
        agurenko@protonmail.com
Subject: Re: [GIT PULL] QCA: Add and update Bluetooth firmwares for WCN785x
 with USB interface
Message-ID: <lmntn442hpprtvhxifxqdycpcqhjcl2oz4fp2egozv5vb7c75v@nm7nojxkmtkh>
References: <882c9f31-96a2-4057-aab1-5d39df3f20b7@quicinc.com>
 <r5wix6wmi5mw43cyzwb3j36az66nih2bwurkikgwgw33kltg3p@b7hyrp3kqyg4>
 <CA+5PVA7=qvpoY1VsxbReiLjKYhFd3xysmC51VvVujWQ2MkZtiQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+5PVA7=qvpoY1VsxbReiLjKYhFd3xysmC51VvVujWQ2MkZtiQ@mail.gmail.com>
X-Proofpoint-ORIG-GUID: 933VImBq9iLr0rzKCT-tjjYMPQGApJaJ
X-Authority-Analysis: v=2.4 cv=KtdN2XWN c=1 sm=1 tr=0 ts=67f51a8c cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=p0WdMEafAAAA:8 a=EUspDBNiAAAA:8 a=NG4bnrSi0PW1LX1fIt4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 933VImBq9iLr0rzKCT-tjjYMPQGApJaJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_04,2025-04-08_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080090

On Tue, Apr 08, 2025 at 07:59:40AM -0400, Josh Boyer wrote:
> On Tue, Apr 8, 2025 at 7:43 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Thu, Apr 03, 2025 at 05:41:11PM +0800, Zijun Hu wrote:
> > > Hi linux-firmware maintainers
> > >
> > > Here's a pull request for btqca bluetooth driver. Please let me know if
> > > you have any problems.
> > >
> > > The following changes since commit 41a528251649772edbcb705a40e617fd14858e53:
> > >
> > >   Merge branch 'intel/guc_70402' into 'main' (2025-03-04 19:09:49 +0000)
> > >
> > > are available in the git repository at:
> > >
> > >   https://github.com/zijun-hu/qca_btfw hmt_usb_x86_0403
> > >
> > > for you to fetch changes up to b12240420adec3089fa0bb5a09eaa0cefbd8ce76:
> > >
> > >   QCA: Add 8 bluetooth nvm files for WCN785x btusb (2025-04-03 17:18:24
> > > +0800)
> >
> >
> > Josh, it seems this pull request got ingored / skipped by the robot.
> > Could you please take a look?
> 
> Thank you for the heads up.  There was a merge conflict in WHENCE that
> I manually fixed up.  New MR here:
> 
> https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/510

Thanks! It seems check-commits errors out on merge commits.

-- 
With best wishes
Dmitry
