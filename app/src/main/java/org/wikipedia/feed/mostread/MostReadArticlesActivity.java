package org.wikipedia.feed.mostread;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;

import androidx.annotation.NonNull;

import org.wikipedia.R;
import org.wikipedia.activity.SingleFragmentActivity;
import org.wikipedia.json.GsonMarshaller;
import org.wikipedia.json.GsonUnmarshaller;
import org.wikipedia.util.ResourceUtil;

public class MostReadArticlesActivity extends SingleFragmentActivity<MostReadFragment> {
    protected static final String MOST_READ_CARD = "item";

    public static Intent newIntent(@NonNull Context context, @NonNull MostReadListCard card) {
        return new Intent(context, MostReadArticlesActivity.class)
                .putExtra(MOST_READ_CARD, GsonMarshaller.marshal(card));
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setNavigationBarColor(ResourceUtil.getThemedColor(this, R.attr.paper_color));
    }

    @Override
    public MostReadFragment createFragment() {
        return MostReadFragment.newInstance(GsonUnmarshaller.unmarshal(MostReadItemCard.class, getIntent().getStringExtra(MOST_READ_CARD)));
    }
}
