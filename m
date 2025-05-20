Return-Path: <SRS0=18vT=YE=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D79AC3ABDD
	for <linux-firmware@archiver.kernel.org>; Tue, 20 May 2025 10:49:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0081EC4CEEB; Tue, 20 May 2025 10:49:30 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D9FE1C4CEE9
	for <linux-firmware@kernel.org>; Tue, 20 May 2025 10:49:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D9FE1C4CEE9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54K8jKi2012231
	for <linux-firmware@kernel.org>; Tue, 20 May 2025 10:49:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LohkSzycuOvEPtbbQ+2QjMfm
	6jAd4xsNna8b0YOkLU4=; b=YC2Vihovpop1NahbbzuTmjyTDlVnP24LpecEh3yS
	giIO+Ttn+oqFk7BiD0Kilw/J26haKG3Qlx5c19+z8I6ifJQpKPE/9tteKNLULCHo
	Bk/xSpP68sAGcCsTleu5XW9nSY5bUzPV8Xd2jfgPjsNjPM7APr8drXVsaKflW6KV
	c1slFqporWbcFTW0LyuFIQ4RUJqgrzxWuVQxOcedrOws2uPF7SgCb3KCoT2I7Qjh
	eBeSBeClwgPQZ9TpzFFSnnYFnHsPesCocr9ddEW0yFYBqBGTAm0/HjMkpxciHHrT
	uiD9V/WcLK9dvwuLnUcX9utDkufYEUGEdgR4XMz0M/lv3A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjjsybvg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 20 May 2025 10:49:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5f3b94827so904889085a.0
        for <linux-firmware@kernel.org>; Tue, 20 May 2025 03:49:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747738166; x=1748342966;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LohkSzycuOvEPtbbQ+2QjMfm6jAd4xsNna8b0YOkLU4=;
        b=cIGw4pRUf4lF4eXuTIV+NOfZ+KZ4VrWeGZaOthj4T9F7l1SHkggooI4UUfJDILcU1J
         ZfJdN4MF1fSzWlW5h3mzEwscppMexXUTpi6laaVZlFmia52S7g89F0OAp3ANvieMTNAQ
         gHH1GVj4V/LgOj0fh5whO33lWW6nIXl773Ny4ji6igCFq0/Q5GdsBetJseRAMKQa9qOL
         zEqHliwsDqFLeyRxXDaihMkauXexuvIO8UD3aIqFKilshYGZ0NREnk1Z7cJWfzzbpWMX
         Ohd4HIvQfCLjI8Z4jcRrZaZs20stb7MwCCu1Aj44B5HnbbbwV+ubCw5SWeufXoeExTaL
         ucww==
X-Gm-Message-State: AOJu0Yw7aP05FLD0z4GaDOifPVZJ16402WHaP8vBod5KFq46I764DKhk
	oI4RIcYRlm7A+mqciIeIGEcm8dOjx0+5A2gogpElV9RwDTseFPemPTBu8+EKBEZ+K1aGrGM5aa3
	nowSbJD3H2T+yWDCvYoGyeIglXzUbNxGZv7EBHpXaQrMCLevpo1RNWGvR5an4akE=
X-Gm-Gg: ASbGncuVTyYgxneobavljB3U9MHcaP5GgW8l2Cg5SiCcVCFY5tI/TIag+lOkABM0eES
	DtNWuchfZVJj24A2OJInnRfkzaavR7JPh+rmEr7ne/jk7lU4mCa8rtpWPEOSEXfNyeoVxhJ6w6Q
	ksziKj63/s1pj/MKnc4EEuWrQI0fjIH1ZmZeMtTJCPWkKTFYiFesL63dp2mIYwPR8vQSRy1TU1b
	eeyHmf5NnUFGsE5epXibuWZkQq6BMAxSz5wtcIF8i/morJz9nb0WlMg7F6mK45Jgc+1id9JAz8c
	wyWsM5CW0XFY9FjbN+2uI1+RnzGoY858K1i7+JCm1infxELI7mYcAddGSnUMggojUifIi5XaIvE
	=
X-Received: by 2002:a05:6214:cc2:b0:6f8:ac64:64ca with SMTP id 6a1803df08f44-6f8b0828750mr238336046d6.6.1747738166496;
        Tue, 20 May 2025 03:49:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8xWFIT72Q1EcOZD+HfWSgbBYVm6LVPEKfv+7wAGfCjM6eNFbuUrcJjslVc4B7oyE7elUG6A==
X-Received: by 2002:a05:6214:cc2:b0:6f8:ac64:64ca with SMTP id 6a1803df08f44-6f8b0828750mr238335656d6.6.1747738166128;
        Tue, 20 May 2025 03:49:26 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e702a289sm2302778e87.163.2025.05.20.03.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 03:49:25 -0700 (PDT)
Date: Tue, 20 May 2025 13:49:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nas Chung <nas.chung@chipsnmedia.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>,
        "nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>,
        "jackson.lee" <jackson.lee@chipsnmedia.com>,
        "lafley.kim" <lafley.kim@chipsnmedia.com>,
        "ming.qian@oss.nxp.com" <ming.qian@oss.nxp.com>
Subject: Re: [PATCH] cnm: Add Chips&Media wave633c firmware for NXP i.MX9
Message-ID: <6xhadxewl3l6ryqs3noeoo3rh3gugxuwt5fsrlxcd3c67rypzn@tvrpe3u7k6gh>
References: <20250519081835.25562-1-nas.chung@chipsnmedia.com>
 <4fs3jqwf6hk6cqaiipbuwwe2u5dcdijig23hlqeiqjh27kmyug@ptxv6u4jqjfq>
 <SL2P216MB1246D2BCF13E83FA41282141FB9FA@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SL2P216MB1246D2BCF13E83FA41282141FB9FA@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
X-Proofpoint-ORIG-GUID: YUoNXf3UxAiSOQMyLJp5o-tUIrNkEshm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDA4OSBTYWx0ZWRfXyLExAl4wgTHk
 r/8PGaNcfVvEQ29IoW6l/sVIfPBpKJjI610sUOsNAOuHKgRkZQUMQbIuJWTz2bAUH2IxGL6cac1
 Hbt14MFimS3MLCfE7MfQiseRIQCPxScLpZSCVTazqk0WAhYVl3PBejyU2l91y6LRP03X+GPaZBE
 SmG5b31/x5p/MLzGIk/B+1UtBeNlcw3OlJ60frnLHqIjM/iqgXC7OLTA9307UThW4W3LaeKY91y
 ohvt+zgG3vY+dfEqVw9gAwANcj3Ac7vf/pHbUMCBWbamU6r/TNHo2Ycvy5hk6kvap2lB2q3n7r+
 EjtMyWWz6PqCziteVE4he05XWzfipG5v40zbl7H9ZIouHW3VMyrcmLz+N3e5q8SCcgcktnwSFIx
 YFvwMBld6L+ZajdT9kWRYxIDAnSRKr+4wqaFe2G2LIFWzuHL1tigDeRQS/VEWs0jAXZSCI4c
X-Authority-Analysis: v=2.4 cv=K4giHzWI c=1 sm=1 tr=0 ts=682c5e37 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=PssDBZGIAAAA:8 a=VwQbUJbxAAAA:8
 a=QX4gbG5DAAAA:8 a=8AirrxEcAAAA:8 a=rFi1gl6yAWF6C-oLSKsA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=HJRSn2hXXqGixlvEXVkw:22 a=AbAUZ8qAyYyZVLSsDulk:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: YUoNXf3UxAiSOQMyLJp5o-tUIrNkEshm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 mlxlogscore=999 suspectscore=0 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505200089

On Tue, May 20, 2025 at 01:07:45AM +0000, Nas Chung wrote:
> Hi, Dmitry.
> 
> >-----Original Message-----
> >From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >Sent: Monday, May 19, 2025 7:28 PM
> >To: Nas Chung <nas.chung@chipsnmedia.com>
> >Cc: linux-firmware@kernel.org; nicolas.dufresne@collabora.com; jackson.lee
> ><jackson.lee@chipsnmedia.com>; lafley.kim <lafley.kim@chipsnmedia.com>;
> >ming.qian@oss.nxp.com
> >Subject: Re: [PATCH] cnm: Add Chips&Media wave633c firmware for NXP i.MX9
> >
> >On Mon, May 19, 2025 at 05:18:35PM +0900, Nas Chung wrote:
> >> Add the firmware for the Chips&Media wave633c codec IP,
> >> which integrates both decoder and encoder functionality.
> >> This firmware is intended for use on NXP SoCs based on
> >> the i.MX9 architecture.
> >>
> >> The LICENSE.cnm file has been updated to restrict redistribution
> >> of this firmware to NXP silicon products only.
> >
> >Is there any chance to change this? This make a life of Linux
> >distributions much harder. They can not include your firmware at all,
> >having to strip it from the _source_ packages too. A better idea might
> >be to allow redistribution (so that distros can include it into source
> >archive or into the CD / packages), but limit usage (as hopefully was
> >intended).
> 
> My intention was also to allow redistribution while restricting usage,
> but I ended up doing both unintentionally.
> Your suggestion exactly aligns with what I had in mind.
> 
> Thanks a lot for your feedback !

THanks a lot for the prompt response!

-- 
With best wishes
Dmitry
