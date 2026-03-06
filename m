Return-Path: <SRS0=UNu/=BG=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63939F01835
	for <linux-firmware@archiver.kernel.org>; Fri,  6 Mar 2026 13:55:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 351D8C2BC86; Fri,  6 Mar 2026 13:55:52 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 42A8BC4CEF7
	for <linux-firmware@kernel.org>; Fri,  6 Mar 2026 13:55:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 42A8BC4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626BbT963727660
	for <linux-firmware@kernel.org>; Fri, 6 Mar 2026 13:55:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Q0n1/ENpg9mVATOw4UAt8Uee
	bZ08dx+cLz389zXqI1U=; b=AextnTIKptvLt4qwro6DdhOiRFlifO36A5hzUzk+
	5CryDpiynDGrlhHzleokHUhB2cpXh5oHgOQS5lYkahkJiRoWq0B8fuaiZB4JinlE
	HIV/sU7T5eNaHbJYqYYtNrQs8zyLK8rhQUD3O1KGUw9BSwQmJxyTIpDmVuxYp76T
	VmaS/N6uCBogDb5enzDk1jm3hj026dlnRfO8vCXHXMFjWW4OTy2eXC4ZLHQvqn7Y
	NIq2OlsFnA9G+NU77d7Z2zQD6LRiLpi6Lkj2RnRd8yeWKxN6bJwpaxUia+rQdRcu
	hb841iNqI8B79dmjZ9FgwuFGMtXn+yhL/f+F2mI/d08bsg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqgp430wg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 06 Mar 2026 13:55:49 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70ef98116so6091205585a.1
        for <linux-firmware@kernel.org>; Fri, 06 Mar 2026 05:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772805349; x=1773410149; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q0n1/ENpg9mVATOw4UAt8UeebZ08dx+cLz389zXqI1U=;
        b=D77l02fsiz+GMrD1Puxwt2zCLdeA1DMK3eXDY7pVkPDdOzmssLXOnIR0vEl0r2zk87
         UUlUpkXQrjL34IfQ354BCPChtuGWZd0cwr5Pb3X9o28AI6OqZCW7x38jYe9BmAR91UKI
         c6HJxw/R8k1CjCOzCKFhpVGJ8wabtdKV7O3ARE88x/SY3HnWi5MASCGxJ3Q2fdUn0w5f
         lyvd8H413hYyj1lGWa6YltdOFPGVN/Ykg1sGsnB0QmesXpSQCdPrYY4dU/I60ASExAFW
         x7YgOQvcsBDTV1htVsb65Trt7o0wg4tXThBgBYBtLXJK1ohxgdsVL98JsT57xl4j7Hhf
         /PlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772805349; x=1773410149;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q0n1/ENpg9mVATOw4UAt8UeebZ08dx+cLz389zXqI1U=;
        b=uR+WE9kn52OL6GfaVmkpzobqFSYHOqhyIPJ4dNIqnM8LNZicr+SvknF/2NqA6IBTyL
         7U9V0Yx9d96sybi/hLaxYagoD/0iXq9EYQDZxbu0uZ9v4h7bSHcyD4CzWrh88lyQGNEK
         ioh3ZUql9Mlo/jGXVnT94R8/f/2qxVOySzCvLPzMThWydWuaMWHrRe6n4yLhuikqVeqC
         WSgS38Yu698li7afrMkFAPLsM5mTmq6eQC10ap4YPCvvwDHvgccMu/i2NCyjoQfq2oWg
         W/q0RE04NniUifgP3rSfMR7SQ7P+sncQXogoFBf8dOn+CBqWUe1qoNFmouKuyNHe+9ed
         CJ9w==
X-Gm-Message-State: AOJu0YwmEo8zOVCFfECkUQ4wopsgJMYPWUmrczJpCKuMYXkOXjb1pDOV
	aMc6VjuDUj9Jai6aWq1T0qrkKoNyVAYVN3Vc4KivzuKfwYy3UC9RVoDvhJewlRgW9pOY+jOBpK3
	IDaPw+4F3fUehhYp8d59bGEvPJqOUYXC4bIFn74rXtehL01tKgCuwlFO+WHRwIlE=
X-Gm-Gg: ATEYQzyQ0Hc9ZM/sMsNmO6UtyLoyfSg9boac5d0Wek3WpD2pv7dWRTJSyFOCZeIvDM7
	NkbV525yNZyDnuqghOCbYX6zFz3OPIbfVb3nA0Jq+btvysswOPLqguaaTa2IiSoif2H7d3WB5f8
	r0r1Ru5QoCUc1zJRx3Be19cLQSlARGqrsRq/8che9cagegkYh6jRiDPO6zXM9CI5DNf66tmwE7Y
	Gd9DPL7D1vEczbp9FhETnVQzVllECWt7Vb7atIFUBUS8tAHVfluKIm4HECkrI1phndxv9jsm5FU
	ZzE/z2wcLzLKy1xpWKY4gyKXxmABbMRnUpbv/wSkH2Kg9rf1JBIz98N/UqGbgFeFL/tP0ebiYVO
	RQ3jgPgZhi05Okpe+INrjkP2ptNR9AdnD8LQrUszYloqzofPEqq5CwsNKqvh/q3OAOELDG5eyJi
	NMhPUDOLXA1EvsResvKypbmpprJA91FyjGRR0=
X-Received: by 2002:a05:620a:2847:b0:8cb:52e0:15e7 with SMTP id af79cd13be357-8cd6d44c291mr266888285a.33.1772805349163;
        Fri, 06 Mar 2026 05:55:49 -0800 (PST)
X-Received: by 2002:a05:620a:2847:b0:8cb:52e0:15e7 with SMTP id af79cd13be357-8cd6d44c291mr266884385a.33.1772805348595;
        Fri, 06 Mar 2026 05:55:48 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d08603dsm350944e87.68.2026.03.06.05.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 05:55:47 -0800 (PST)
Date: Fri, 6 Mar 2026 15:55:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wei Deng <wei.deng@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, jwboyer@kernel.org,
        cheng.jiang@oss.qualcomm.com
Subject: Re: [GIT PULL] QCA: Update Bluetooth QCA6698 firmware to 2.1.2-00069
Message-ID: <yaxsj2mjfuelewkqzw5rpkg3dsua22ji2xu5zsb5paiazqf3du@xvhrhtmfacyk>
References: <164b619a-2991-47e3-bcdc-e94d99ed98c2@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <164b619a-2991-47e3-bcdc-e94d99ed98c2@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: _6R1c2P0SLIf9wcAaE-TRhOPyMJRd0KA
X-Authority-Analysis: v=2.4 cv=LegxKzfi c=1 sm=1 tr=0 ts=69aadce5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=NEAV23lmAAAA:8
 a=p0WdMEafAAAA:8 a=1Nc0QwgvpEfiYMTs6FAA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDEzNCBTYWx0ZWRfX9+ufPQwaLz9L
 wmQN+weMIErnUsf/byZuUzzgr0pxRL/Zp5DGSsjPjHCEXOTUlmghiGUHw89xMDDV4y/kPzxjKtH
 6ciYTYcdth4hzGSi2SeXmf4CDXQasMgryKG8Ap0atPvz+2z4oSFm/OACgkJ1x6N9Z3UpXa/rNFp
 wlDYLmgZXv8/RDTudYhF80b+V3sPjCw1KxKtNxwbyX4Nq3oG01jBWMVxeFVBBbafAJXjAXyrj1O
 E95+wgAg8z9f6SmQ55HevnHHVd9R77gkr2CGoGEBhOADlaErCrSJqYJ0WHeAQJ+D4RdL1SiTMZV
 lHK4MGS+fr1TJPVARgY5fY6gZxCh1JjRoIrHe6ZMbzCtMl9/cFLxtBDATpwcJzANmsEy60hfu2n
 bsVYu/y2erjGgwxkmcYvWI7A+ctO+TFUjjoN/BQEM/I2om7RxabVl9km71hOIFFVVNXm+ZBay7z
 DkPsS9EvxBJtrhEKVig==
X-Proofpoint-GUID: _6R1c2P0SLIf9wcAaE-TRhOPyMJRd0KA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060134

On Fri, Mar 06, 2026 at 04:25:05PM +0800, Wei Deng wrote:
> Hi linux-firmware maintainers,
> 
> Here's a pull request for btqca bluetooth driver. Please let me know if
> you have any problems.
> 
> The following changes since commit 7d2b4c758cfd02c2ba1c807f234c0afc308789e5:
> 
>   Merge branch 'robot/pr-0-1772726739' into 'main' (2026-03-05 18:17:02 +0000)
> 
> are available in the Git repository at:
> 
>   https://github.com/WeiDeng-weiden/qca_btfw.git main
> 
> for you to fetch changes up to b251087087e8a2fd8b1b2523a66286048f3626bb:
> 
>   QCA: Update Bluetooth QCA6698 firmware to 2.1.2-00069 (2026-03-06 13:08:59 +0530)

Thanks, merged and pushed out:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/947

> 
> ----------------------------------------------------------------
> Wei Deng (1):
>       QCA: Update Bluetooth QCA6698 firmware to 2.1.2-00069
> 
>  qca/QCA6698/hpbtfw21.tlv | Bin 161716 -> 167212 bytes
>  qca/QCA6698/hpnv21.b206  | Bin 6614 -> 6656 bytes
>  qca/QCA6698/hpnv21.b207  | Bin 6702 -> 6744 bytes
>  qca/QCA6698/hpnv21.bin   | Bin 6614 -> 6656 bytes
>  4 files changed, 0 insertions(+), 0 deletions(-)
> -- 
> Best Regards,
> Wei Deng
> 

-- 
With best wishes
Dmitry
