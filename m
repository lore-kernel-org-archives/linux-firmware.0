Return-Path: <SRS0=uphp=E4=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AABB2C43458
	for <linux-firmware@archiver.kernel.org>; Thu,  2 Jul 2026 12:42:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8D4B31F00A3D; Thu,  2 Jul 2026 12:42:47 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1782996167;
	b=uhDieZhCQ97tfcq+uV2o0DZwr4Qn95rOodjDSlqLXpE1kT8JE/Q06U5ObI4lshO4wEzS
	 wQq2qxdsVY2/syNjObOjCXuhaJqroof4PebjuXlws15ZlwS/FF/K3AXL+Jb61bvQzzS0e
	 JgkpNsfri8A9PCjFPhBoW71XbL48xBbDhkgwV8AbOOf7YeZYsiv+xjeztXYdJmejFCYps
	 LpCFCmsJaa/5C2h2KKTElj6Kt5DGtK245+/E8h1Ey4lpm5EVK28/E0BtqXJyCIRi4bHY+
	 doxMUCl4mvb20iVvvQaktzP+zRgCKnKms5GoUcmZzVaY4ar8IhhDEh/Oa5I3wVJIssg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1782996167;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=aB0/3lyXHC3ZlM5SwFzi5j4guLDgZlNjnzid/utDH7E=;
	b=v+NMCk1tCZoqSf4y1VMtXyJI9Duk5cAjWcU4Gwg6CWjte6aSeQy8OfzHwAovmy2gsY07
	 26sNNON8g9SEYi3JEufrwDUchlTM0zNgC15qDdZvH8iraFOJ6QAfgf36JUEmdqVlOUdGQ
	 3gR2Pu+0anPSA4pLKHetkPlB4HV3v8FSuAAN3L6ncV5pLXhohqTepvRPrJjKxnYO1M3Iw
	 omultuXmmdp0wuV8pcdnYYO9dc/KKnbFuJadk52Pz1GZxx68Ik0UvVDAyeEH2TX8IgNXg
	 /b+EOvMbasxN7akosSFiSYyF/YK8+GtJrpmTmqZOzo4Vk9l82xng/TY+s8ZxS0JVorw==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mJBKst+O;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xd9X+13t;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DEB211F00A3A
	for <linux-firmware@kernel.org>; Thu,  2 Jul 2026 12:42:46 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mJBKst+O;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xd9X+13t
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org DEB211F00A3A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6629nNYs4139472
	for <linux-firmware@kernel.org>; Thu, 2 Jul 2026 12:42:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aB0/3lyXHC3ZlM5SwFzi5j4g
	uLDgZlNjnzid/utDH7E=; b=mJBKst+OMR5KcMFc2JKBQMbAfP7KoWxb55hHtBGS
	9g2VKZE7rU64T2P3OMn/WcyPooBtMab7l4/48RTI+7lOI4lhzZ7ECd/ugPaZKOC1
	KltM6a8/aXg6Y3qUy2fbRuTY7NmA+Ce4P+geAowOWAcMMyyElnk4Txe04vN7Jfbl
	SttmubuweSUSx2KUWEGFBgUNLEnsnPFrZsOhy+QHhKXikPw/yr+HtuRlKWlIuAdH
	fq9OGxYuObQwpqbnNl2fVrJWuZYbow/0JGBJM9O3C6sc4ILs2ceqCSVH10TGdr0f
	0Ri83OqJqKex31j98t19W1sc2/gber6r0clidS14sANBqw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5npr8n1f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 02 Jul 2026 12:42:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e4f946461so211032785a.2
        for <linux-firmware@kernel.org>; Thu, 02 Jul 2026 05:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782996165; x=1783600965; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aB0/3lyXHC3ZlM5SwFzi5j4guLDgZlNjnzid/utDH7E=;
        b=Xd9X+13tDFSLO6sfol1Jx56AevNswJJNkYLHLdatdKEBPeJ649pkRyMlxma9JZOKQ4
         hI9becRqrsk3UP/4g8b9mS9+NOBSU3nOoJ+lmIINa4omggPpOVSnDyLP4OhaaEG7pJRA
         GEhLu7lR1+at3O95X83Pw6uvRiqUecPwe6GsPhJQTTHihOz2JrS3aGiR3YMR5mVD9uit
         7m49O6eUpj/F43RTXQV4W/Ot/idmoBc0MxWWBtCWBysq69jdXxi4DIh+qoee7ktpCEmz
         YFSX8cw7M9RN5wFtbj8Uk1XiiviiYUYZAGmxH1ZXbfXvaKNbvSSXCTcH411D03GWxwUw
         XNUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782996165; x=1783600965;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aB0/3lyXHC3ZlM5SwFzi5j4guLDgZlNjnzid/utDH7E=;
        b=dhE7PFNiTf6CRtEpTw/iqWWqttE8e6xsrlSB3VKlvBXqR1cNdC6y9F6t4JN+Xdtb4x
         i2UaunsBbQKxygQ6+rx0uGaSfo8w7EuK3ep8oi10Vwc1utXOSadhtV0SpLb51Jg+Nwo6
         x8C4dB1qy2jTpLtvnEAefqpHoX1aWRI62ZTkiJhvi+jMv1EPnMM7gVJttgvrejc8z9MZ
         FrOZOF+EkxJOuGCU9xX/aLINzx4aBxCkJLEuV67eE2u+NG8horAdHCyyQKXjnd3XGJwg
         ch2mPz4YEuGjRWGpH+v0Nes98s4q3b67rTlIxtppc3in7/UUhNkOMo+1wfVyXV/y+m7+
         e5Bg==
X-Gm-Message-State: AOJu0YwK4BO54I4f8EW0RTfvUEZCftFBFFaZObCsN8/O3MIStAymEMmx
	bfJSb2tpKhXNh7EsRDBt3okjVhjKqAeAtQ6z9IZTk8x2PbyQHBSRqOU14tStlLLWZMxVT/qV2mO
	1BhasOnkO4FUmwT6Kah0QgDOkpTT56iBpDTtjIAauYZy24AR8Tx+wyaVQ7ps+tHA=
X-Gm-Gg: AfdE7cnLxAjkMviT3q8tyr8E/ZyTo1bPapaNDtaKzxNWP74zOCeW8CckDkVaIumrD/C
	uCTImYsQjN+jdcxQCI2goQiKGK3srYo5xqZQrDJUI1OrjdGXJGVJCZHWG0t1+tPhNbkntrYpc93
	K4Y0p8gikz8qDS3920LlAkI1G+0RzJurlmk3pB9L16BnSTNruAROpSjXvUNwQkMD/8NAmfG7dCW
	5SR7Nk2yyqMT8f6TsRYAd0VPX9KM65AYBzH47d843H9K6m5QkbBa3fM8Pk6pkggMMJPOsfMUgUL
	Vtpa3NTp/UBZC0vE5CEQajNczYojA8p1r+Gcy3AbMYrSRFQScgIygokM4UTdyaMmIGXbjBCrXIw
	zC2scigu/w5X7glemBoh2zxQ9EUZ/YnKw/2rUi4e48jIm5vR1+D3zX8sN+i8+8Xv4Z1n6inaDnH
	ro+FGRiZdYvyqquyYCO5hrLIuO
X-Received: by 2002:a05:620a:a18f:20b0:92e:7ba3:73e2 with SMTP id af79cd13be357-92e7ba37697mr501590685a.74.1782996165237;
        Thu, 02 Jul 2026 05:42:45 -0700 (PDT)
X-Received: by 2002:a05:620a:a18f:20b0:92e:7ba3:73e2 with SMTP id af79cd13be357-92e7ba37697mr501587685a.74.1782996164732;
        Thu, 02 Jul 2026 05:42:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b37fe9e91sm5484791fa.34.2026.07.02.05.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 05:42:43 -0700 (PDT)
Date: Thu, 2 Jul 2026 15:42:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Korenblit, Miriam Rachel" <miriam.rachel.korenblit@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>,
        "Dreyfuss, Haim" <haim.dreyfuss@intel.com>,
        "Yang, You-Sheng" <vicamo.yang@canonical.com>,
        "kyle@infradead.org" <kyle@infradead.org>,
        "Hutchings, Ben" <ben@decadent.org.uk>,
        Josh Boyer <jwboyer@kernel.org>,
        linux-wireless <linux-wireless@vger.kernel.org>,
        "Grumbach, Emmanuel" <emmanuel.grumbach@intel.com>
Subject: Re: pull request: iwlwifi firmware update 2026-07-02
Message-ID: <uubxec2mrfo3xbjl6arfsyrqagvekwx2rgluyij6twfzyy2sry@ucjmqa3jpurz>
References: <DS0PR11MB788099813ABEFABD32A85E36A3F52@DS0PR11MB7880.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DS0PR11MB788099813ABEFABD32A85E36A3F52@DS0PR11MB7880.namprd11.prod.outlook.com>
X-Proofpoint-ORIG-GUID: A71fzsSmqA7I4BX8WYXwki_7q8v7zrGD
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEzMyBTYWx0ZWRfX67woXZ10u8zQ
 bVz0hoMmGnR9CDjLV1GsNoi67cBUFBhh5H3szN9hqdSX2zpRMhcTzEpbDsAQiKb9ow5Q6FtMSjP
 4JaS/VxqSTLk80WAiAw18U4V5i5ClRU=
X-Authority-Analysis: v=2.4 cv=NsvhtcdJ c=1 sm=1 tr=0 ts=6a465cc6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=p0WdMEafAAAA:8
 a=pOhtE3V0Tdau712M8d4A:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: A71fzsSmqA7I4BX8WYXwki_7q8v7zrGD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEzMyBTYWx0ZWRfXwRi3R3vT/xiI
 WjupR/6HzCPpehANg+4RVcP7p0mBAzyTYIHtSN8bC8JwpMcwWAKwHEaMNKzlbP2FR16lO79xcUj
 mDAnIy6fPDkOw+yFRST27sLh2RZ3bd6LgD27v2oqJmUV4PXOBxzemMi6Ygr1pLOotHLpUOjerZL
 QhqS1h8LtLGi+6QC2ISu5YYKzwhUdEUYUQrbIL8ngteQz5Il4HxS3rO7pdicRdGoQCOH3e+jRAs
 RTimCGwVYs0Bb92eUv6bf02/rKxQ0qmpucPgLvIqaA6oyBgS/LkUFiVug0sB5FJYRppQ0R3Nl2H
 3W7kbOtz3HbPwBy+AIH7MXzguDLclIx2MYZS+rGxdfIhITRY+GjgAmDj7HHC7RpeTj4vxEqgmIw
 zB1XhEekI4rbjZk6bBNrvhXGOP8J1dvoFflSB4vZK0BCWPXxk+IYjiZuINyqMR9qfFETNa98CrT
 U0/alTfYDFpzvQdP0DQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020133

On Thu, Jul 02, 2026 at 12:29:13PM +0000, Korenblit, Miriam Rachel wrote:
> Hi,
> 
> This contains the firmware of core24.60 (106) for all supported devices.
> 
> Please pull or let me know if there are any issues.

Thanks, merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1132

> 
> Thanks,
> Miri
> ---

-- 
With best wishes
Dmitry
