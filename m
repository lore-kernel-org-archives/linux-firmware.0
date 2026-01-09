Return-Path: <SRS0=be0w=7O=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1658D16812
	for <linux-firmware@archiver.kernel.org>; Fri,  9 Jan 2026 11:16:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 95292C16AAE; Fri,  9 Jan 2026 11:16:40 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B5B0FC4CEF1
	for <linux-firmware@kernel.org>; Fri,  9 Jan 2026 11:16:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B5B0FC4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6099jIOI007893
	for <linux-firmware@kernel.org>; Fri, 9 Jan 2026 11:16:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	INZ6EizOWv98hBZPfdrPwtcJuPZ0LK6wVFXaElXhDCM=; b=MSFni1cDrUKxhO80
	GEmI2mM6eqbQ12rk5+fs8GzKQY9nqWIe33i2jgX7UjGP1p/6gx2RgFJnQT4f13BE
	m9lBxawei18pElZlkp0FGB59Hmxt94jE4v13KSImzrtCwZOQcB20YVBD6hzQb0rG
	vQ7Jj+B0Rahw+D67BiOkC7HowCJylC/2xW56TTifzMeGDTUGEXimjWCmjlemzNq+
	ahWR4lQjJunR0+2rKF6DVK6pfpsMhwB6Der+zHaFJoiwdVuljXKbriNG54DvLcXB
	fwz7sAVmG3t7NgvPZdWByhuFW4oD0BWipwoVmqViYtBaoNQQWQXAWxk1cYQ9B2X+
	arKmgA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjyaqg8aq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 09 Jan 2026 11:16:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2f0be2cf0so837818285a.0
        for <linux-firmware@kernel.org>; Fri, 09 Jan 2026 03:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767957398; x=1768562198; darn=kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=INZ6EizOWv98hBZPfdrPwtcJuPZ0LK6wVFXaElXhDCM=;
        b=c8Jls69cjtmSXNdw+03NZNr9cjbBrhy2Qas6Su5ycMLtz8ELsRUInyp29up2IMWQ1D
         71nsZcT43tA4Vn/tC28RjHpMnb7stYgKO0m3vyGx/7R88U1OFfaYX/aEd9HiEBgGsmju
         a/HVR9qGxOXWvfPnmWz5tSDNIQs6g3oQqOpsCd1VmrYv6sqgnuZlbFUSQ81pIXF+j9nU
         EZhsfVWw9CyEUZ1sjQureDt/LPyqA9W5PFULOfFPxsK4PF77unw46YGLvm2/wx9skQw+
         26S8Knh8VNPzhsu4+L+u0xandFvduWMtKEmWRWdPPezK4LQBW0l/mgtrSryJvPtORLuM
         LGvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767957398; x=1768562198;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=INZ6EizOWv98hBZPfdrPwtcJuPZ0LK6wVFXaElXhDCM=;
        b=nFKpoSGbI0QW/4njmAO9czhpPq3ttewi7oNpePEE/8qHwC92EsO+1hJAwUytE+fw7r
         Z6ht4PyPRn9LS7c8EtZPEmZzLvLyohYN+6KQAybByIN1dXcX5I7Bs/kJNpTY79sFGko2
         H/LM0hoYeOnI7I9ZJbCtQqCe73O+9Ehzldb9S8Evw8wILTkiW0vNxE/8DoVU1Mi7P3HZ
         l8bHhgyiGkSKJ9SnRyHd9tIaic6IZQx5E++i9rlQ7uvh09UjFDs8ibkn7YpJfGWaYTzR
         86ztVZBrJ8F9vEqgi1s6ifCsApZxkXM+qf+JsCN3OJMYMfIZhLZZt9KbFZOvNz6iqbua
         GuYA==
X-Gm-Message-State: AOJu0Yzc2Q7PAwGQSGPV8IH066CEOHRoJ7yyhjcF5kJ/sUVvj47EysM1
	oR+AdATqVwheqMOqe7yo7fxWVVJBqwr4PJEG/3Q5fjpsZqKhu9cBfHjbaSeRIog6JbV8kO3ZvNV
	nvZgcXeqtUmusQUFbFTHl5W2wqj7COx5eikfSNbj4ZpAvZ+z0Dv1hDhyjHqKriFM=
X-Gm-Gg: AY/fxX7xDld1gC56+ieT3Ry0P6sOwgyug1uMVM1Np4g8DQU0G4TEAvknm2GwOAZbRAd
	JEQRnh96FXf3hvU3PmvE0ZkFSf/jZumis3JfTBn875heScQJ+mwY0HNBnThMjMHuWmq+B837ZXu
	vwGlM5sQ0IOVYAeiN1BqHktUtlHbc0+9hKJf+N5kG/3RgVOuTWXH+nvVhhtxK1U/ZP0oS1V9jXl
	EYjLmtsilAhh+nndSW1ymXEtvIPVq0cTu4LfQT685cjFx/0FqQJQypf/VrjeGDNtRsDo9ehdLK3
	uLQMVzISU21+0246q4F9lo3y0JaYgkj+hgSZ2zRYM2V52RAMD+dgkRULrChYPItQBL11xIQdIjG
	5oeLFj+iihq9VK1u0oGYea3tM4vR/KtPrMzw9yrq46UI8jOHSJUV2Jn1f4djNfWKuMYjcIzS/sa
	jTKOQF7ayad5JHf6PBj4c2OlU=
X-Received: by 2002:a05:620a:2801:b0:8c3:7ff1:5eb3 with SMTP id af79cd13be357-8c389405e9amr1335958585a.64.1767957397674;
        Fri, 09 Jan 2026 03:16:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGEV+9bFOW4KmXNz9HQ+tfl6zkJXjtqvRTRftufuQKapURmHAPkiEHliDDW9R+uLU0mi8ydFQ==
X-Received: by 2002:a05:620a:2801:b0:8c3:7ff1:5eb3 with SMTP id af79cd13be357-8c389405e9amr1335955485a.64.1767957397207;
        Fri, 09 Jan 2026 03:16:37 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382ffe2b913sm14350101fa.33.2026.01.09.03.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 03:16:36 -0800 (PST)
Date: Fri, 9 Jan 2026 13:16:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vivek Sahu <vivek.sahu@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org,
        "Mohammed Sameer Mulla (QUIC)" <quic_mohamull@quicinc.com>,
        "Harish Bandi (QUIC)" <quic_hbandi@quicinc.com>,
        quic_janathot@quicinc.com
Subject: Re: QCA: Add Bluetooth firmware for QCC2072 uart interface
Message-ID: <psonfqdp3driwwuo3ihs7u5cclt4exo6khaapyd2wlagcyq3ib@y4cratso4m7v>
References: <ade99252-a85c-4399-92f1-56156f509814@oss.qualcomm.com>
 <iep7i32ovru6j42fx5l54rmw3ihhoetd4isvwpkvvwlekujcx3@ytwjeawwqz6w>
 <ead2a8c2-c466-4f37-a9db-79a54bcd6a22@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ead2a8c2-c466-4f37-a9db-79a54bcd6a22@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA4MiBTYWx0ZWRfX6WUWIQzc8TmD
 BLJc9JsMmekj1Y05rVCizNNE9pHoGvJxSW76CfacdAZd6tEnXO409Nhd1qnQmbHIrPVCNAM+EIH
 SMPLz41hmDfZLspL00nKHEG4oiPrWJul0CicegxHAbdGkfRF/qZvtLMqe/3NRWUZo4b5sX4r3M/
 NfULodEkpev+SA7zphqcUq9HAp7yEJApufqe7GjSooIn899zPVp3PlQSs6TXKlMAp76WT8xc05t
 DumfHeXZuQnjRbKeRoUV9qwb/DS37QG568wX+xzHOF+XP8zIg7wmbbCGbgR+9ZA9Wd87vpcwmEd
 YMgR2ANNpHk2qicgtcX1TbpxUQ4LQovdkb9jKhM2aI+vARTnNsPG0kgqAR3wEEEVIBeTf/a+bbb
 4P0clLsW71gzUkErRuzmWuYQc6pneZxyX9xnwbJ8Gm6hj1ruB0Dey2+Yl/ozUgqdHeNdneBHzpw
 neT4I/hTP7+xHxIAJWA==
X-Proofpoint-GUID: -B1laxdusgFJg5CD4fTmkl7VMH03WA5v
X-Authority-Analysis: v=2.4 cv=IKUPywvG c=1 sm=1 tr=0 ts=6960e396 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=X1pLZwKMAgBRjrU8_VIA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: -B1laxdusgFJg5CD4fTmkl7VMH03WA5v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_03,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090082

On Fri, Jan 09, 2026 at 12:24:58PM +0530, Vivek Sahu wrote:
> 
> On 1/8/2026 6:18 PM, Dmitry Baryshkov wrote:
> > On Thu, Jan 08, 2026 at 02:33:22PM +0530, Vivek Sahu wrote:
> > > Hi linux-firmware maintainers,
> > > 
> > > Here's a pull request for btqca bluetooth driver. Please let me know if you
> > > have any problems.
> > > 
> > > 
> > > The following changes since commit e272e0d1edce58496c3917f7422b9531daeb0535:
> > > 
> > >    Merge branch 'robot/pr-0-1767725013' into 'main' (2026-01-06 19:05:06
> > > +0000)
> > > 
> > > are available in the Git repository at:
> > > 
> > >    https://github.com/vivesahu-huboss/Cologne_FW_Upstream.git HEAD
> > > 
> > > for you to fetch changes up to 5fce4edd5a84b09c670918cfcaa0705eaf1c2b60:
> > > 
> > >    QCA: Add Bluetooth firmware for QCC2072 uart interface This commit will
> > > add required Bluetooth firmware files for QCC2072 uart interface.
> > > (2026-01-08 13:20:45 +0530)
> > > 
> > > ----------------------------------------------------------------
> > > Vivek Kumar Sahu (1):
> > >        QCA: Add Bluetooth firmware for QCC2072 uart interface This commit
> > > will add required Bluetooth firmware files for QCC2072 uart interface.
> > Oh. And your git setup is broken. How did you end up with the SoB not
> > matching the Author of the commit (yes, I really want to know, how).
> 
> 
> my gitconfig file was not updated with oss mail id leading to this issue.

Are you writing the SoB manually? I'm asking because `git commit -s`
would use the same Git config for both Author and SoB.

> I'll update it in next commit.
> 
> > 

-- 
With best wishes
Dmitry
